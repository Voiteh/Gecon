import ceylon.collection {
	Hashtable,
	linked,
	HashMap
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
shared class HashMapCreator() satisfies  Creator<Map<>,{Anything*}> {
	shared actual Map<> create(Context context,Class<Map<>,Nothing> kind, {Anything*} arguments) {
		return kind.apply(linked, Hashtable(), arguments);
	}
	matcher => object satisfies Creator<Map<>,{Anything*}>.Matcher {
		shared actual Boolean match(Class<Map<>,Nothing> kind, {Anything*} arguments) {
			return kind.declaration==`class HashMap`;
		}
		
		shared actual Integer priority => 1;
	};
}