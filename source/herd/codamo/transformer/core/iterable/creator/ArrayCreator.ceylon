
import ceylon.language.meta.model {
	Class
}

import herd.codamo.api.core.transformer {
	Creation,
	Delegator,
	Creator,
	provided
}

"Creator for [[Array]], using any iterable as argumets."
tagged("Generic")
by("Wojciech Potiopa")
shared provided class ArrayCreator() satisfies  Creator<{Anything*},List<>> {
	shared actual List<> create(Delegator delegator,Class<List<>,Nothing> kind, {Anything*} arguments) {
		return kind.apply(arguments);
	}
	
	shared actual Creation<{Anything*},List<Anything>,List<Anything>>.Matcher? matcher => object satisfies Creation<{Anything*},List<Anything>,List<Anything>>.Matcher{
		shared actual Boolean match(Class<List<>,Nothing> kind, {Anything*} arguments) {
			return kind.declaration==`class Array`;
		}
		
		shared actual Integer priority => 1;	
	};
}

