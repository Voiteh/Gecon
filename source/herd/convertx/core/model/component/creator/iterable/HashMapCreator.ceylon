import ceylon.collection {
	Hashtable,
	linked,
	HashMap
}
import herd.convertx.api.component {
	Creator,
	wired
}
import ceylon.language.meta.model {
	Class
}
import herd.convertx.api {
	Context
}
wired
shared class HashMapCreator() satisfies  Creator<{Entry<Object,Anything>*},Map<>> {
	shared actual Map<> create(Context context,Class<Map<>,Nothing> kind, {Entry<Object,Anything>*} arguments) {
		return kind.apply(linked, Hashtable(), arguments);
	}
	matcher => object satisfies HashMapCreator.Matcher {
		shared actual Boolean match(Class<Map<>,Nothing> kind, {Entry<Object,Anything>*} arguments) {
			return kind.declaration==`class HashMap`;
		}
		
		shared actual Integer priority => 1;
	};
}