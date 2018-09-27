import herd.codamo.json.meta {
	JsonPartialization
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

shared wired class JsonObjectCreator() satisfies Creator<JsonPartialization,JsonObject>{
	shared actual JsonObject create(Delegator delegator, Class<JsonObject,Nothing> kind, JsonPartialization arguments) => JsonObject(arguments.parts);
	
}