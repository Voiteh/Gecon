import herd.codamo.transformer.json.meta {
	JsonMapping
}


import ceylon.language.meta.model {
	Class
}
import ceylon.json {
	JsonObject
}
import herd.codamo.api.core.transformer {
	Creator,
	
	Delegator
}
"Creates [[JsonObject]] out of [[JsonMapping]]"
by("Wojciech Potiopa")
shared class JsonObjectCreator() extends Creator<JsonMapping,JsonObject>(){
	shared actual JsonObject create(Delegator delegator, Class<JsonObject,Nothing> kind, JsonMapping arguments) => JsonObject(arguments.mappings);
	
}