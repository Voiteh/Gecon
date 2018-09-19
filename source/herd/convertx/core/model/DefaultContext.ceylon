import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	Type,
	Class
}

import herd.convertx.core.internal {
	Registry,
	SearchStrattegy,
	defaultStrategy
}
shared class DefaultContext(Registry registry,SearchStrattegy searchStrattegy=defaultStrategy) satisfies Context{
	shared actual Result convert<Result>(Anything source, Type<Result> resultType) {
		 value flatten=searchStrattegy.search(registry.converters, [source,resultType]);
		 return flatten.flat<Result>([this,source,resultType]);	
	}
	
	shared actual Result create<Result>(Class<Result,Nothing> kind, Anything args) {
		value flatten=searchStrattegy.search(registry.creators, [kind,args]);
		return flatten.flat<Result>([this,kind,args]);
	}
	
	shared actual Class<Result,Nothing> resolve<Result>(Anything source, Type<Result> resultType) {
		value flatten=searchStrattegy.search(registry.resolvers, [source,resultType]);
		return flatten.flat<Class<Result>>([this,source,resultType]);
	}
	
}