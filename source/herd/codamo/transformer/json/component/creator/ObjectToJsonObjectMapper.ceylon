
import herd.codamo.transformer.json.meta {
	JsonMapping
}
import ceylon.language.meta.model {
	Attribute,
	Class
}

import herd.codamo.api.core.meta {
	Relation
}
import ceylon.json {
	Value,
	JsonObject
}
import herd.codamo.api.core.meta.component {
	ObjectToObjectMapper
}
import herd.codamo.api.core.transformer {
	provided,
	Creation,
	Delegator
}

"Creates [[JsonMapping]] from [[Relation]] between generic object and [[JsonObject]] type"
by("Wojciech Potiopa")
shared provided class ObjectToJsonObjectMapper() extends ObjectToObjectMapper<JsonMapping, {<String->Value>*}, JsonObject>(){
	shared actual JsonMapping createMapping({<String->Value>*} holder) => JsonMapping(holder);
	
	shared actual {<String->Value>*} mapAttributes(Delegator delegator,Object source, {Attribute<Nothing,Anything,Nothing>*} attributes) => attributes.map((Attribute<> element) {
		value val=element.bind(source).get();
		if(is Value val ){
			return element.declaration.name->val;
		}
		else{
			return element.declaration.name->delegator.convert(val, `Value`);
		}
	});
	
	shared actual Creation<Relation<Object,JsonObject>,JsonMapping,JsonMapping>.Matcher? matcher => object satisfies Creation<Relation<Object,JsonObject>,JsonMapping,JsonMapping>.Matcher{
		shared actual Boolean match(Class<JsonMapping,Nothing> kind, Relation<Object,JsonObject> arguments) => true;
		
		shared actual Integer priority => 2;
		
	};
		
}

