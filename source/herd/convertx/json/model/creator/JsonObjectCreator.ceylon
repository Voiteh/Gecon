import herd.convertx.json.model.meta {
	JsonPartialization
}

import herd.convertx.api {
	Context,
	Creator,
	wired
}
import ceylon.language.meta.model {
	Class
}
import ceylon.json {
	JsonObject
}

shared wired class JsonObjectCreator() satisfies Creator<JsonPartialization,JsonObject>{
	shared actual JsonObject create(Context context, Class<JsonObject,Nothing> kind, JsonPartialization arguments) => JsonObject(arguments.parts);
	
}