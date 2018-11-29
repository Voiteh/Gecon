import ceylon.collection {
	Hashtable,
	HashSet,
	linked
}
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
"Creator for [[HashSet]] using any iterable as arguments"
tagged("Generic")
by("Wojciech Potiopa")
shared provided class HashSetCreator() satisfies  Creator<{Anything*},Set<>> {
	shared actual Set<> create(Delegator delegator,Class<Set<>,Nothing> kind, {Anything*} arguments) {
		return kind.apply(linked, Hashtable(), arguments);
	}
	
	shared actual Creation<{Anything*},Set<Object>,Set<Object>>.Matcher? matcher => object satisfies Creation<{Anything*},Set<Object>,Set<Object>>.Matcher{
		shared actual Boolean match(Class<Set<>,Nothing> kind, {Anything*} arguments) {
			return kind.declaration==`class HashSet`;
		}
		
		shared actual Integer priority => 1;
	};
}


