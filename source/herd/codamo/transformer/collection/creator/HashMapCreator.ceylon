import ceylon.collection {
	Hashtable,
	linked,
	HashMap
}
import ceylon.language.meta.model {
	Class
}


import herd.codamo.api.core.transformer {
	Creator,
	provided,
	Creation,
	Delegator

}

"Creator for [[HashMap]] using [[Entry]] iterable as arguments."
tagged("Generic")
by("Wojciech Potiopa")
shared provided class HashMapCreator() satisfies  Creator<{Entry<Object,Anything>*},Map<>> {
	shared actual Map<> create(Delegator delegator,Class<Map<>,Nothing> kind, {Entry<Object,Anything>*} arguments) {
		return kind.apply(linked, Hashtable(), arguments);
	}
	
	shared actual Creation<{<Object->Anything>*},Map<Object,Anything>,Map<Object,Anything>>.Matcher? matcher => object satisfies Creation<{<Object->Anything>*},Map<Object,Anything>,Map<Object,Anything>>.Matcher{
		shared actual Boolean match(Class<Map<>,Nothing> kind, {Entry<Object,Anything>*} arguments) {
			return kind.declaration==`class HashMap`;
		}
		
		shared actual Integer priority => 1;
	};
}



