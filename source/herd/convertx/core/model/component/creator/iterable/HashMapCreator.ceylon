import ceylon.collection {
	Hashtable,
	linked,
	HashMap
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

shared wired class HashMapCreator() satisfies  Creator<{Entry<Object,Anything>*},Map<>> {
	shared actual Map<> create(Context context,Class<Map<>,Nothing> kind, {Entry<Object,Anything>*} arguments) {
		return kind.apply(linked, Hashtable(), arguments);
	}
	
	shared actual Creation<{<Object->Anything>*},Map<Object,Anything>,Map<Object,Anything>>.Matcher? matcher => object satisfies Creation<{<Object->Anything>*},Map<Object,Anything>,Map<Object,Anything>>.Matcher{
		shared actual Boolean match(Class<Map<>,Nothing> kind, {Entry<Object,Anything>*} arguments) {
			return kind.declaration==`class HashMap`;
		}
		
		shared actual Integer priority => 1;
	};
}



