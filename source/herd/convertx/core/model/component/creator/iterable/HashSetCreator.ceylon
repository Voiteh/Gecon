import ceylon.collection {
	Hashtable,
	HashSet,
	linked
}
import ceylon.language.meta.model {
	Class
}
import herd.convertx.api {
	Context,
	Creator,
	wired
}
import herd.convertx.api.operation {
	Creation
}

shared wired class HashSetCreator() satisfies  Creator<{Anything*},Set<>> {
	shared actual Set<> create(Context context,Class<Set<>,Nothing> kind, {Anything*} arguments) {
		return kind.apply(linked, Hashtable(), arguments);
	}
	
	shared actual Creation<{Anything*},Set<Object>,Set<Object>>.Matcher? matcher => object satisfies Creation<{Anything*},Set<Object>,Set<Object>>.Matcher{
		shared actual Boolean match(Class<Set<>,Nothing> kind, {Anything*} arguments) {
			return kind.declaration==`class HashSet`;
		}
		
		shared actual Integer priority => 1;
	};
}


