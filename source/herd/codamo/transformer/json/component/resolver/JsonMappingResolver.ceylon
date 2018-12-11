import herd.codamo.api.core.meta {
	Mapping,
	Relation
}

import ceylon.language.meta.model {
	Class,
	Type
}

import herd.codamo.transformer.json.meta {
	JsonMapping
}
import ceylon.json {
	JsonObject
}

import herd.codamo.api.core.transformer {
	Resolver,
	provided,
	Resolvance,
	Delegator
}

"Resolves [[Relation]] to [[JsonMapping]]" 
by("Wojciech Potiopa")
shared provided class JsonMappingResolver() satisfies Resolver<Relation<Object, JsonObject>,Mapping>{
	shared actual Class<Mapping,Nothing> resolve(Delegator delegator, Relation<Object, JsonObject> input, Type<Mapping> outputType) => `JsonMapping`;
	
	
	shared actual Resolvance<Relation<Object,JsonObject>,Mapping,Type<Mapping>>.Matcher? matcher => object satisfies Resolvance<Relation<Object,JsonObject>,Mapping,Type<Mapping>>.Matcher{
		shared actual Boolean match(Relation<Object, JsonObject> input, Type<Mapping> outputType) => true;
		
		shared actual Integer priority => 2;
	};
	
	
}

