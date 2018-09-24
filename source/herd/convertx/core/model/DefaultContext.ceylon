import herd.convertx.core.api {
	Context,
	Provider
}
import ceylon.language.meta.model {
	Type,
	Class
}

import herd.convertx.core.api.logicals {
	Logical,
	Registry
}
import herd.convertx.core.api.component {
	Component
}
import herd.convertx.core.internal {
	DefaultLogical
}
shared class DefaultContext satisfies Context{
	
	Registry registry;
	Logical logical;
	shared new(Logical logical=DefaultLogical(),[Provider+] providers=[CoreProvider()]){
		this.registry=Registry();
		this.logical=logical;
		Object[] configurations=providers.flatMap((Provider element) => element.configurations).sequence();
		Component[] components=providers.flatMap((Provider element) => element.components).sequence();
		
		logical.configurator.configure(logical.finder, configurations);
		logical.configurator.configure(logical.visitor, configurations);
		logical.configurator.configure(logical.registrator, configurations);
		components.each((Component element) => logical.configurator.configure(element, configurations));
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