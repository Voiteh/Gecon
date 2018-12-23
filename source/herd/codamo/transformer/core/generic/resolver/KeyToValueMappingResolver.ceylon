import herd.codamo.api.core.meta {
	Mapping,
	Relation,
	KeyToValueMapping
}
import ceylon.language.meta.model {
	Class,
	Type
}


import herd.codamo.api.core.transformer {
	Resolver,
	provided,
	Resolvance,
	Delegator
}

"Resolves [[Mapping]] from [[Relation]]"
tagged("Generic")
by("Wojciech Potiopa")
shared provided class KeyToValueMappingResolver() satisfies Resolver<Relation<Object,Map<String,Anything>>,Mapping> {
	shared actual Class<Mapping,Nothing> resolve(Delegator delegator, Relation<Object,Map<String,Anything>> type, Type<Mapping> outputType) => `KeyToValueMapping`;
	
	shared actual Resolvance<Relation<Object,Map<String,Anything>>,Mapping,Type<Mapping>>.Matcher? matcher => object satisfies Resolvance<Relation<Object,Map<String,Anything>>,Mapping,Type<Mapping>>.Matcher {
		shared actual Boolean match(Relation<Object,Map<String,Anything>> input, Type<Mapping> outputType) => true;
		
		shared actual Integer priority => 1;
	};
}
