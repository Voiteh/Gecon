import ceylon.json {
	JsonObject
}
import ceylon.language.meta.model {
	Class,
	Type
}

import herd.codamo.api.core.meta {
	Mapping,
	Relation
}
import herd.codamo.api.core.transformer {
	Resolver,
	Delegator,
	Matchable
}
import herd.codamo.transformer.json.meta {
	JsonMapping
}

"Resolves [[Relation]] to [[JsonMapping]]" 
by("Wojciech Potiopa")
shared class JsonMappingResolver() extends Resolver<Relation<Object, JsonObject>,Mapping,Type<Mapping>>(){
	shared actual Class<Mapping,Nothing> resolve(Delegator delegator, Relation<Object, JsonObject> input, Type<Mapping> outputType) => `JsonMapping`;
	
	
	matchable=> object satisfies Matchable<Relation<Object,JsonObject>,Type<Mapping>>{
		shared actual Boolean predicate(Relation<Object,JsonObject> source, Type<Mapping> resultType) => true;
		
		shared actual Integer priority = 2;
		
		
	};
	
}

