import ceylon.language.meta.model {
	Class,
	Type
}

import herd.codamo.api.core.meta {
	Mapping,
	Relation,
	AttributesMapping
}
import herd.codamo.api.core.transformer {
	Resolver,
	Delegator,
	Matchable
}

"Resolves [[AttributesMapping]] from [[Relation]]"
tagged("Generic")
by("Wojciech Potiopa")
shared class FromObjectToObjectRelationAttributeMappingResolver() extends Resolver<Relation<Object,Object>,Mapping,Type<Mapping>>() {
	shared actual Class<AttributesMapping,Nothing> resolve(Delegator delegator, Relation<Object,Object> source, Type<Mapping> outputType) => `AttributesMapping`;
	
	
	matchable => object satisfies Matchable<Relation<Object,Object>,Type<Mapping>>{
		shared actual Boolean predicate(Relation<Object,Object> source, Type<Mapping> resultType) => true;
		
		shared actual Integer priority =0;
		
		
	};
}
