import ceylon.collection {
	Hashtable,
	HashSet,
	linked
}
import herd.convertx.core.api.component {
	Creator,
	Component
}
import ceylon.language.meta.model {
	Class
}
import herd.convertx.core.api {
	Context
}
service(`interface Component`)
shared class HashSetCreator() satisfies  Creator<Set<>,{Anything*}> {
	shared actual Set<> create(Context context,Class<Set<>,Nothing> kind, {Anything*} arguments) {
		return kind.apply(linked, Hashtable(), arguments);
	}
	matcher => object satisfies Creator<Set<>,{Anything*}>.Matcher {
		shared actual Boolean match(Class<Set<>,Nothing> kind, {Anything*} arguments) {
			return kind.declaration==`class HashSet`;
		}
		
		shared actual Integer priority => 1;
	};
}