import herd.convertx.core.api {
	Context,
	Provider,
	Logical
}
import ceylon.language.meta.model {
	Type,
	Class
}


import herd.convertx.core.api.component {
	Component
}
import herd.convertx.core.internal {
	DefaultLogical
}
import herd.convertx.core.api.registration {
	Registry
}
import herd.convertx.core.api.configuration {
	Configuration,
	Configurable
}
shared class DefaultContext satisfies Context{
	
	Registry registry;
	Logical logical;
	shared new(Logical logical=DefaultLogical(),[Provider+] providers=[CoreProvider()]){
		this.registry=Registry();
		this.logical=logical;
		Configuration[] configurations=providers.flatMap((Provider element) => element.configurations).sequence();
		Component[] components=providers.flatMap((Provider element) => element.components).sequence();
		if(is Configurable<> finder=logical.finder){
			logical.configurator.configure(finder, configurations);
		}
		if(is Configurable<> visitor=logical.visitor){
			logical.configurator.configure(visitor,configurations);
		}
		if(is Configurable<> registrator=logical.registrator){
			logical.configurator.configure(registrator,configurations);
		}
		components.narrow<Configurable<>>()
				.each((Configurable<> element) => logical.configurator.configure(element, configurations));
		logical.registrator.register(logical.visitor, registry, providers.flatMap((Provider element) => element.components).sequence());
		
	}
	
	
	
	shared actual Result convert<Result>(Anything source, Type<Result> resultType) {
		 value flatten=logical.finder.find(registry.converters, [source,resultType]);
		 return flatten.execute<Result>([this,source,resultType]);	
	}
	
	shared actual Result create<Result>(Class<Result,Nothing> kind, Anything args) {
		value flatten=logical.finder.find(registry.creators, [kind,args]);
		return flatten.execute<Result>([this,kind,args]);
	}
	
	shared actual Class<Result,Nothing> resolve<Result>(Anything source, Type<Result> resultType) {
		value flatten=logical.finder.find(registry.resolvers, [source,resultType]);
		return flatten.execute<Class<Result>>([this,source,resultType]);
	}
	
}