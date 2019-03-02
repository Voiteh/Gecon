import ceylon.collection {
	HashMap
}
import ceylon.language.meta.model {
	Class,
	Type
}

import herd.codamo.api.core.transformer {
	Resolver,
	Delegator,
	Matchable
}


"Resolves any object to [[HashMap]]"
shared class ObjectToMapResolver() extends Resolver<Object,Map<String,Anything>,Type<Map<String,Anything>>>(){
	
	shared actual Class<Map<String,Anything>,Nothing> resolve(Delegator delegator, Object type, Type<Map<String,Anything>> outputType) => `HashMap<String,Anything>`;
	
	matchable => object satisfies Matchable<Object,Type<Map<String,Anything>>>{
		shared actual Boolean predicate(Object source, Type<Map<String,Anything>> resultType) => true;
		
		shared actual Integer priority =0;
		
		
	};
	
}

