import ceylon.language.meta.model {
	Class,
	Type
}


import herd.codamo.api.meta {
	Mapping,
	Relation,
	AttributesMapping
}
import herd.codamo.api.operation {
	Resolvance,
	Delegator,
	wired
}
import herd.codamo.api.component {
	Resolver
}

"Resolves [[AttributesMapping]] from [[Relation]]"
tagged("Generic")
by("Wojciech Potiopa")
shared wired class FromObjectToObjectRelationAttributeMappingResolver() satisfies Resolver<Relation<Object,Object>,Mapping> {
	shared actual Class<AttributesMapping,Nothing> resolve(Delegator delegator, Relation<Object,Object> source, Type<Mapping> outputType) => `AttributesMapping`;
	
	shared actual Resolvance<Relation<Object,Object>,Mapping,Type<Mapping>>.Matcher? matcher => object satisfies Resolvance<Relation<Object,Object>,Mapping,Type<Mapping>>.Matcher {
		shared actual Boolean match(Relation<Object,Object> input, Type<Mapping> outputType) => true;
		
		shared actual Integer priority => 0;
	};
}
