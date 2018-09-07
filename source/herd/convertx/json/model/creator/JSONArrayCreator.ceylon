import herd.convertx.core.api.component {
	wired,
	Creator
}
import herd.convertx.json {
	JSONArray,
	JSONValue
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	Class
}

wired
shared class JSONArrayCreator() satisfies Creator<JSONArray,{JSONValue*}> {
	shared actual JSONArray create(Context context, Class<JSONArray,Nothing> kind, {JSONValue*} arguments) => JSONArray(arguments);
	
	matcher => object satisfies JSONArrayCreator.Matcher {
		shared actual Boolean match(Class<JSONArray,Nothing> kind, {JSONValue*} arguments) => true;
		
		shared actual Integer priority => 1;
	};
}
