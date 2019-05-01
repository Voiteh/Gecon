import ceylon.collection {
	HashMap
}
import ceylon.language.meta.model {
	Class,
	Type
}

import herd.codamo.api.core.transformer {
	Resolver,
	Delegator}


"Resolves any object to [[HashMap]]"
shared class ObjectToMapResolver() extends Resolver<Object,Map<String,Anything>,Type<Map<String,Anything>>>(){
	
	shared actual Class<Map<String,Anything>,Nothing> resolve(Delegator delegator, Object type, Type<Map<String,Anything>> outputType) => `HashMap<String,Anything>`;
	
	matcher => Matcher{
		Boolean predicate(Object source, Type<Map<String,Anything>> resultType) => true;
		Integer priority =0;
		
	};
	
}

