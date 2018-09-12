import herd.convertx.json {
	JSONObject
}
import herd.convertx.json.model.meta {
	JSONPartialization
}
import herd.convertx.core.api.component {
	Creator,
	wired
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	Class
}
wired
shared class JsonObjectCreator() satisfies Creator<JSONObject,JSONPartialization>{
	shared actual JSONObject create(Context context, Class<JSONObject,Nothing> kind, JSONPartialization arguments) => JSONObject(arguments.parts);
	
}