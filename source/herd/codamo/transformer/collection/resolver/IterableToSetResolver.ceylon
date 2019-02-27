import ceylon.collection {
	HashSet
}
import ceylon.language.meta.model {
	Class,
	Interface
}

import herd.codamo.api.core.transformer {
	Resolver,
	Delegator,
	Matchable
}
"Resolves [[HashSet]] from any iterable type"
tagged("Generic")
by("Wojciech Potiopa")
shared class IterableToSetResolver() extends Resolver<{Anything*},Set<>,Interface<Set<>>>(){
	
	shared actual Class<Set<>> resolve(Delegator delegator,{Anything*} input,Interface<Set<>> outputType) { 
	
		value typeForIterable = iterableTypeArgument(outputType);
		return `class HashSet`.classApply<Set<>>(typeForIterable);
	}		
	matchable => object satisfies Matchable<{Anything*}, Interface<Set<Object>>>{
		shared actual Boolean predicate({Anything*} source, Interface<Set<Object>> resultType) => true;
		
		shared actual Integer priority => 1;
		
		
	};

	
}

