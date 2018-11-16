
import ceylon.language.meta.model {
	Type,
	Class
}
import herd.codamo.api.configuration {
	Configuration
}

import herd.codamo.api.operation {
	Operation,
	Delegator
}
import herd.codamo.api.provision {
	Provider
}
import herd.codamo.core.search {
	Finder,
	DefaultFinder
}
import herd.codamo.core.registration {
	Registry,
	DefaultRegistrator,
	Registrator
}

import herd.codamo.core.configuration {
	DefaultConfigurator,
	Configurator
}

import herd.codamo.core.provisioning {
	CoreProvider
}
"Defaykt implementation of delegator"
by("Wojciech Potiopa")
shared class DefaultDelegator satisfies Delegator{
	
	"Registry which helds components"
	Registry registry;
	"Finder for finding an operation"
	Finder finder;
	shared new(
		"A flatter for operation flattening"
		Operation.Flatter visitor=DefaultFlatter(),
		"Finder for finding an operation"
		Finder finder=DefaultFinder(),
		"Registrates operations in [[Registry]]"
		Registrator registrator=DefaultRegistrator(),
		"Configurates configurable objects using [[Configuration]]"
		Configurator configurator=DefaultConfigurator(),
		"Providers uses for extracting operations"
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