

import ceylon.language.meta.model {
	Class
}
import ceylon.json {
	JsonArray,
	Value
}

import herd.codamo.api.core.transformer {
	Creator,
	provided,
	Creation,
	Delegator
}

"Creates [[JsonArray]] out of iterable of [[Value]]."
by("Wojciech Potiopa")
shared provided class JsonArrayCreator() satisfies Creator<{Value*},JsonArray> {
	shared actual JsonArray create(Delegator delegator, Class<JsonArray,Nothing> kind, {Value*} arguments) => JsonArray(arguments);
	

	shared actual Creation<{Value*},JsonArray,JsonArray>.Matcher? matcher => object satisfies Creation<{Value*},JsonArray,JsonArray>.Matcher{
		shared actual Boolean match(Class<JsonArray,Nothing> kind, {Value*} arguments) => true;
		
		shared actual Integer priority => 1;
	};
		
}
