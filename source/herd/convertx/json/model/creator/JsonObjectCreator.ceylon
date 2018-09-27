import herd.convertx.json.model.meta {
	JsonPartialization
}

import herd.convertx.api {
	wired
}
import ceylon.language.meta.model {
	Class
}
import ceylon.json {
	JsonObject
}
import herd.convertx.api.component {
	Creator
}
import herd.convertx.api.operation {
	Delegator
}

shared wired class JsonObjectCreator() satisfies Creator<JsonPartialization,JsonObject>{
	shared actual JsonObject create(Delegator delegator, Class<JsonObject,Nothing> kind, JsonPartialization arguments) => JsonObject(arguments.parts);
	
}