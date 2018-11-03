import herd.codamo.json.meta {
	JsonMapping
}


import ceylon.language.meta.model {
	Class
}
import ceylon.json {
	JsonObject
}
import herd.codamo.api.component {
	Creator
}
import herd.codamo.api.operation {
	Delegator,
	wired
}

shared wired class JsonObjectCreator() satisfies Creator<JsonMapping,JsonObject>{
	shared actual JsonObject create(Delegator delegator, Class<JsonObject,Nothing> kind, JsonMapping arguments) => JsonObject(arguments.mappings);
	
}