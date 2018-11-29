
import ceylon.language.meta.model {
	Class
}

import herd.codamo.api.operation {
	Creation,
	Delegator,
	provided
}
import herd.codamo.api.component {
	Creator
}

"Creator for [[Entry]] using iterable as arguments, only first two items will be taken in consideration. Arguments size must be equals 2."
tagged("Generic")
by("Wojciech Potiopa")
shared provided class EntryCreator() satisfies Creator<{Anything*},Entry<Object,Anything>> {
	shared actual Object->Anything create(Delegator delegator,Class<Object->Anything,Nothing> kind, {Anything*} arguments) {
		value key = arguments.first;
		assert (exists key);
		value item = arguments.rest.first;
		return kind.apply(key, item);
	}

	shared actual Creation<{Anything*},Object->Anything,Object->Anything>.Matcher? matcher => object satisfies Creation<{Anything*},Object->Anything,Object->Anything>.Matcher {
		shared actual Boolean match(Class<Object->Anything,Nothing> kind, {Anything*} arguments) => arguments.size==2;
		
		shared actual Integer priority = 1;
	};
}
