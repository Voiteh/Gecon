
import herd.convertx.api {
	Context,
	Creator,
	wired
}
import ceylon.language.meta.model {
	Class
}
import ceylon.json {
	JsonArray,
	Value
}
import herd.convertx.api.operation {
	Creation
}

wired
shared class JsonArrayCreator() satisfies Creator<{Value*},JsonArray> {
	shared actual JsonArray create(Context context, Class<JsonArray,Nothing> kind, {Value*} arguments) => JsonArray(arguments);
	

	shared actual Creation<{Value*},JsonArray,JsonArray>.Matcher? matcher => object satisfies Creation<{Value*},JsonArray,JsonArray>.Matcher{
		shared actual Boolean match(Class<JsonArray,Nothing> kind, {Value*} arguments) => true;
		
		shared actual Integer priority => 1;
	};
		
}
