import herd.convertx.api {
	Context,
	Provider
}
import ceylon.language.meta.model {
	Type,
	Class
}


import herd.convertx.api.component {
	Component
}
import herd.convertx.core.internal {
	DefaultVisitor,
	DefaultFinder,
	DefaultRegistrator,
	DefaultConfigurator
}
import herd.convertx.api.registration {
	Registry,
	Visitor,
	Registrator
}
import herd.convertx.api.configuration {
	Configuration,
	Configurator
}
import herd.convertx.api.search {
	Finder
}
shared class DefaultContext satisfies Context{
	
	Registry registry;
	Finder finder;
	shared new(Visitor visitor=DefaultVisitor(),
		Finder finder=DefaultFinder(),
		Registrator registrator=DefaultRegistrator(),
		Configurator configurator=DefaultConfigurator(),
		{Provider*} providers=[CoreProvider()]
	){
		this.registry=Registry();
		this.finder=finder;
		Configuration[] configurations=providers.flatMap((Provider element) => element.configurations).sequence();
		Component[] components=providers.flatMap((Provider element) => element.components).sequence();
		configurator.configure(finder, configurations);
		configurator.configure(visitor,configurations);
		configurator.configure(registrator,configurations);
		components.each((Component element) => configurator.configure(element, configurations));
		registrator.register(visitor, registry, providers.flatMap((Provider element) => element.components).sequence());
		
	}
	
	
	
	shared actual Result convert<Result>(Anything source, Type<Result> resultType) {
		 value flatten=finder.find(registry.converters, [source,resultType]);
		 return flatten.execute<Result>([this,source,resultType]);	
	}
	
	shared actual Result create<Result>(Class<Result,Nothing> kind, Anything args) {
		value flatten=finder.find(registry.creators, [kind,args]);
		return flatten.execute<Result>([this,kind,args]);
	}
	
	shared actual Class<Result,Nothing> resolve<Result>(Anything source, Type<Result> resultType) {
		value flatten=finder.find(registry.resolvers, [source,resultType]);
		return flatten.execute<Class<Result>>([this,source,resultType]);
	}
	
}