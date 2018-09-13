import ceylon.collection {
	LinkedList
}
import herd.convertx.core.api.component {
	Creator,
	wired
}
import ceylon.language.meta.model {
	Class
}
import herd.convertx.core.api {
	Context
}
wired
shared class LinkedListCreator() satisfies Creator<{Anything*},List<Anything>> {
	shared actual List<Anything> create(Context context,Class<List<Anything>,Nothing> kind, {Anything*} arguments) {
		return kind.apply(arguments);
	}
	matcher => object satisfies LinkedListCreator.Matcher {
		shared actual Boolean match(Class<List<Anything>,Nothing> kind, {Anything*} arguments) {
			return kind.declaration==`class LinkedList`;
		}
		
		shared actual Integer priority => 1;
	};
}