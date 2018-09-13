import ceylon.collection {
	Hashtable,
	HashSet,
	linked
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
shared class HashSetCreator() satisfies  Creator<{Anything*},Set<>> {
	shared actual Set<> create(Context context,Class<Set<>,Nothing> kind, {Anything*} arguments) {
		return kind.apply(linked, Hashtable(), arguments);
	}
	matcher => object satisfies HashSetCreator.Matcher {
		shared actual Boolean match(Class<Set<>,Nothing> kind, {Anything*} arguments) {
			return kind.declaration==`class HashSet`;
		}
		
		shared actual Integer priority => 1;
	};
}