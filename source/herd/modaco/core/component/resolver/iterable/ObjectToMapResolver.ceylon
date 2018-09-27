import ceylon.language.meta.model {
	Class,
	Type
}

import ceylon.collection {
	HashMap
}
import herd.modaco.api.operation {
	Resolvance,
	Delegator,
	wired
}
import herd.modaco.api.component {
	Resolver
}

shared wired class ObjectToMapResolver() satisfies Resolver<Object,Map<String,Anything>>{
	shared actual Class<Map<String,Anything>,Nothing> resolve(Delegator delegator, Object type, Type<Map<String,Anything>> outputType) => `HashMap<String,Anything>`;
	
	shared actual Resolvance<Object,Map<String,Anything>,Type<Map<String,Anything>>>.Matcher? matcher => object satisfies Resolvance<Object,Map<String,Anything>,Type<Map<String,Anything>>>.Matcher{
		shared actual Boolean match(Object input, Type<Map<String,Anything>> outputType) => true;
		
		shared actual Integer priority => 0;
	};
	
}

