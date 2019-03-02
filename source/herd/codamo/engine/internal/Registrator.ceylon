
import ceylon.language.meta {
	type
}
import ceylon.language.meta.declaration {
	ClassDeclaration,
	Module,
	Package
}
import ceylon.logging {
	Logger
}

import herd.codamo.api.core {
	Scope
}
import herd.codamo.api.core.transformer {
	Registrable
}
import herd.codamo.engine {
	Provider,
	ManualProvider,
	AutoProvider
}
import herd.type.support {
	flat
}
import herd.codamo.engine.internal.clasification {
	Classificable,
	convertion,
	creation,
	resolvance,
	mapping
}

shared class Registrator(Registrable.Adapter adapter, Logger logger) {
	
	void putInRegistry(Catalog registry,Classificable classificable,Transformation transformation) {
		Transformation? replaced;
		switch (step = classificable.classificator)
		case (convertion) {
			replaced = registry.converters.put(classificable, transformation);
			logger.debug("Registered converter: ``transformation`` using ``type(classificable)``");
		}
		case (resolvance) {
			replaced = registry.resolvers.put(classificable, transformation);
			logger.debug("Registered resolver: ``transformation`` using ``type(classificable)``");
		}
		case (creation) {
			replaced = registry.creators.put(classificable, transformation);
			logger.debug("Registered creator: ``transformation`` using ``type(transformation)``");
		}
		case(mapping){
			replaced = registry.mappings.put(classificable, transformation);
		}
		
		if (exists replaced) {
			throw Exception("Provided ``transformation`` has replaced ``replaced``,
			                           which indicates duplication of transformators for same source and result types.");
		}
	}
	{ClassDeclaration*} extractFromScope(Scope scope) {
		switch (scope)
		case (is ClassDeclaration) {
			return { scope };
		}
		case (is Package) {
			return scope.members<ClassDeclaration>()
				.filter((ClassDeclaration element) {
					if (element.string.contains("MapToAttributesMappings")) {
						value string = element.string;
						logger.trace(string);
					}
					value match = flat.declarations(element)
						.contains(`interface Registrable`);
					logger.trace("Scope element: ``element`` match: ``match``");
					return match;
				}
			);
		}
		case (is Module) {
			return scope.members.flatMap(extractFromScope);
		}
	}
	Registrable instantiate(ClassDeclaration declaration) {
		if (exists defaultConstructor = declaration.defaultConstructor) {
			return defaultConstructor
					.apply<Registrable>()
					.apply();
		}
		throw Exception("Provided declaration ``declaration``, don't have default constructor which is required for instantiation");
	}
	
	shared Catalog register(Provider provider,Catalog updateRegistry=Catalog()) {
		
		{Registrable*} registrables;
		switch (provider)
		case (is ManualProvider) {
			registrables=provider.registrables;
		}
		case (is AutoProvider) {
			{ClassDeclaration*} inclusions = provider.transformations.scopes.flatMap(extractFromScope);
			inclusions.each((ClassDeclaration element) => logger.trace("Included class ``element``"));
			{ClassDeclaration*} exclusions = provider.transformations.exclusions.flatMap(extractFromScope);
			exclusions.each((ClassDeclaration element) => logger.trace("Excluded class ``element``"));
			{ClassDeclaration*} finalDeclarations = inclusions.filter((ClassDeclaration element) {
					if (exclusions.contains(element)) {
						logger.debug("Excluded ``element``");
						return false;
					}
					return true;
				}).distinct;
			registrables=finalDeclarations.collect(instantiate);
		}
		
		registrables.map((Registrable element) => element.visitAdapter(adapter))
				.narrow<[Classificable,Transformation]>()
				.each(([Classificable,Transformation] element) => putInRegistry(updateRegistry,*element));
		
		return updateRegistry;
	}
}
