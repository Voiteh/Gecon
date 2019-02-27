
import ceylon.json {
	Value,
	JsonObject
}
import ceylon.language.meta.model {
	Attribute,
	Class
}

import herd.codamo.api.core.meta {
	Relation
}
import herd.codamo.api.core.meta.component {
	ObjectToObjectMapper
}
import herd.codamo.api.core.transformer {
	Delegator,
	Matchable
}
import herd.codamo.transformer.json.meta {
	JsonMapping
}

"Creates [[JsonMapping]] from [[Relation]] between generic object and [[JsonObject]] type"
by("Wojciech Potiopa")
shared class ObjectToJsonObjectMapper() extends ObjectToObjectMapper<JsonMapping, {<String->Value>*}, JsonObject>(){
	shared actual JsonMapping createMapping({<String->Value>*} holder) => JsonMapping(holder);
	
	shared actual {<String->Value>*} mapAttributes(Delegator delegator,Object source, {Attribute<Nothing,Anything,Nothing>*} attributes) => attributes.collect((Attribute<> element) {
		value val=element.bind(source).get();
		if(is Value val ){
			return element.declaration.name->val;
		}
		else{
			return element.declaration.name->delegator.convert(val, `Value`);
		}
	});
	matchable => object satisfies Matchable<Relation<Object,JsonObject>,Class<JsonMapping,Nothing>>{
		shared actual Boolean predicate(Relation<Object,JsonObject> source, Class<JsonMapping,Nothing> resultType) => true;
		
		shared actual Integer priority =2;
		
		
	};
		
}

