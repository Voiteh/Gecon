import herd.convertx.core.api.component {
	wired,
	Creator
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	Class
}
import ceylon.json {
	JsonArray,
	Value
}

wired
shared class JsonArrayCreator() satisfies Creator<{Value*},JsonArray> {
	shared actual JsonArray create(Context context, Class<JsonArray,Nothing> kind, {Value*} arguments) => JsonArray(arguments);
	
	matcher => object satisfies JsonArrayCreator.Matcher {
		shared actual Boolean match(Class<JsonArray,Nothing> kind, {Value*} arguments) => true;
		
		shared actual Integer priority => 1;
	};
}
