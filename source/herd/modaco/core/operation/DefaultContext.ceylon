
import ceylon.language.meta.model {
	Type,
	Class
}
import herd.modaco.api.configuration {
	Configuration
}

import herd.modaco.api.operation {
	Operation,
	Delegator
}
import herd.modaco.api.provision {
	Provider
}
import herd.modaco.core.search {
	Finder,
	DefaultFinder
}
import herd.modaco.core.registration {
	Registry,
	DefaultRegistrator,
	Registrator
}

import herd.modaco.core.configuration {
	DefaultConfigurator,
	Configurator
}

import herd.modaco.core.provisioning {
	CoreProvider
}

shared class DefaultContext satisfies Delegator{
	
	Registry registry;
	Finder finder;
	shared new(Operation.Flatter visitor=DefaultFlatter(),
		Finder finder=DefaultFinder(),
		Registrator registrator=DefaultRegistrator(),
		Configurator configurator=DefaultConfigurator(),
		{Provider*} providers=[CoreProvider()]
	){
		this.registry=Registry();
		this.finder=finder;
		Configuration[] configurations=providers.flatMap((Provider element) => element.configurations).sequence();
		Operation[] components=providers.flatMap((Provider element) => element.operations).sequence();
		configurator.configure(finder, configurations);
		configurator.configure(visitor,configurations);
		configurator.configure(registrator,configurations);
		components.each((Operation element) => configurator.configure(element, configurations));
		registrator.register(visitor, registry, providers.flatMap((Provider element) => element.operations).sequence());
		
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