import ceylon.json {
	JsonObject
}
import ceylon.language.meta.model {
	Class
}

import herd.codamo.api.core.transformer {
	Creator,
	Delegator
}
import herd.codamo.transformer.json {
	JsonDictionary
}
"Creates [[JsonObject]] out of [[JsonDictionary]]"
by("Wojciech Potiopa")
shared class JsonObjectCreator() extends Creator<JsonDictionary,JsonObject>(){
	shared actual JsonObject create(Delegator delegator, Class<JsonObject,Nothing> kind, JsonDictionary arguments) => JsonObject(arguments);
	
}