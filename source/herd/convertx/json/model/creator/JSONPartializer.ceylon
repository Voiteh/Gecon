import herd.convertx.core.api.component {
	Creator,
	wired
}
import herd.convertx.json.model.meta {
	JSONPartialization
}
import herd.convertx.json {
	JSONObject
}
import ceylon.language.meta.model {
	Type,
	Class
}
import herd.convertx.core.api {
	Context
}
wired
shared class JSONPartializer() satisfies Creator<JSONPartialization,Object->Type<JSONObject>>{
	shared actual JSONPartialization create(Context context, Class<JSONPartialization,Nothing> kind, Object->Type<JSONObject> arguments) => nothing;
	
	matcher => object satisfies JSONPartializer.Matcher{
		shared actual Boolean match(Class<JSONPartialization,Nothing> kind, Object->Type<JSONObject> arguments) => true;
		
		shared actual Integer priority => 1;
		
		
	};
	
}