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
	Delegator,
	Matchable
}

"Creator for [[HashMap]] using [[Entry]] iterable as arguments."
tagged("Generic")
by("Wojciech Potiopa")
shared class HashMapCreator() extends Creator<{Entry<Object,Anything>*},Map<>>() {
	shared actual Map<> create(Delegator delegator,Class<Map<>,Nothing> kind, {Entry<Object,Anything>*} arguments) {
		return kind.apply(linked, Hashtable(), arguments);
	}
	
	shared actual Matchable<{<Object->Anything>*},Class<Map<Object,Anything>,Nothing>>? matchable => object satisfies Matchable<{<Object->Anything>*},Class<Map<Object,Anything>,Nothing>>{
		shared actual Boolean predicate({<Object->Anything>*} source, Class<Map<Object,Anything>,Nothing> resultType) => resultType.declaration ==`class HashMap`;
		
		 priority=1;
	};
	
}



