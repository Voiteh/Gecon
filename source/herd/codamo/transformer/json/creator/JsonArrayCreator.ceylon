import ceylon.json {
	JsonArray,
	Value
}
import ceylon.language.meta.model {
	Class
}

import herd.codamo.api.core.transformer {
	Creator,
	Delegator}

"Creates [[JsonArray]] out of iterable of [[Value]]."
by ("Wojciech Potiopa")
shared class JsonArrayCreator() extends Creator<{Value*},JsonArray>() {
	shared actual JsonArray create(Delegator delegator, {Value*} arguments, Class<JsonArray,Nothing> kind) => JsonArray(arguments);
	
	shared actual Matcher matcher => Matcher {
		Boolean predicate({Value*} source, Class<JsonArray,Nothing> resultType) => true;
		Integer priority = 1;
	};
}
