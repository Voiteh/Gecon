import ceylon.logging {
	Logger
}
import herd.codamo.api.core.transformer {
	Transformation,
	Creation,
	Resolvance,
	Convertion
}
import herd.codamo.engine {
	Provider,
	ManualProvider,
	AutoProvider
}
import ceylon.language.meta.declaration {
	ClassDeclaration,
	Module,
	Package
}
import herd.codamo.api.core {
	Scope
}
import herd.type.declaration.support.hierarchy.api {
	declarationHierarchy
}
import ceylon.language.meta {
	type
}

shared class Registrator(Logger logger, Flatter flatter) {
	
	{ClassDeclaration*} extractFromScope(Scope scope){
		switch(scope)
		case (is ClassDeclaration) {
			return {scope};
		}
		case (is Package){
			return scope.members<ClassDeclaration>().filter((ClassDeclaration element) => 
				declarationHierarchy(element)
					.contains(`interface Transformation`)
					.match
			);
		}
		case (is Module){
			return scope.members.flatMap(extractFromScope);
		}
	}
	
	void putInRegistry(Registry registry,Transformation element){
			assert (is [Findable, Executable] flat = element.flatten(flatter));
			value findable = flat.first;
			Executable? replaced;
			switch (element)
			case (is Convertion<>) {
				replaced = registry.converters.put(*flat);
				logger.debug("Registered converter: ``element`` using ``type(findable)``");
			}
			case (is Resolvance<>) {
				replaced = registry.resolvers.put(*flat);
				logger.debug("Registered resolver: ``element`` using ``type(findable)``");
			}
			case (is Creation<>) {
				replaced = registry.creators.put(*flat);
				logger.debug("Registered creator: ``element`` using ``type(findable)``");
			}
		
			if (exists replaced) {
				throw Exception("Provided ``element`` has replaced ``replaced``,
				                  which indicates duplication of transformators for same source and result types.");
			}
	}
	
	Transformation instantiate(ClassDeclaration declaration){
		if(exists defaultConstructor=declaration.defaultConstructor){
			return defaultConstructor.apply<Transformation>().apply();
		}
		throw Exception("Provided declaration ``declaration``, don't have default constructor which is required for instantiation");
	}
	
	shared Registry register(Provider provider) {
		Registry registry= Registry();
		switch (provider)
		case (is ManualProvider) {
			provider.transformations.each((Transformation element) => putInRegistry(registry, element));
		}
		case (is AutoProvider) {
			{ClassDeclaration*} inclusions=provider.transformations.scopes.flatMap(extractFromScope);
			{ClassDeclaration*} exclusions=provider.transformations.exclusions.flatMap(extractFromScope);
			{ClassDeclaration*} finalDeclrations = inclusions.filter((ClassDeclaration element) {
				if(exclusions.contains(element)){
					logger.debug("Excluded ``element``");
					return false;
				}
				return true;
			}).distinct;
			finalDeclrations.collect(instantiate).each((Transformation element) => putInRegistry(registry, element));
		}
		
	return registry;
	}
}
