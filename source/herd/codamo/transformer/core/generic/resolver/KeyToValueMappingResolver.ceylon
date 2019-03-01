import ceylon.language.meta.model {
	Class,
	Type
}

import herd.codamo.api.core.meta {
	Mapping,
	Relation,
	KeyToValueMapping
}
import herd.codamo.api.core.transformer {
	Resolver,
	Delegator,
	Matchable
}

"Resolves [[Mapping]] from [[Relation]]"
tagged("Generic")
by("Wojciech Potiopa")
shared class KeyToValueMappingResolver() extends Resolver<Relation<Object,Map<String,Anything>>,Mapping,Type<Mapping>>() {
	shared actual Class<Mapping,Nothing> resolve(Delegator delegator, Relation<Object,Map<String,Anything>> type, Type<Mapping> outputType) => `KeyToValueMapping`;
	
	matchable => object satisfies Matchable<Relation<Object,Map<String,Anything>>,Type<Mapping>>{
		shared actual Boolean predicate(Relation<Object,Map<String,Anything>> source, Type<Mapping> resultType) => true;
		
		shared actual Integer priority =1;
		
		
	};
}
