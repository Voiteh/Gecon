import ceylon.collection {
	Hashtable,
	linked,
	HashMap
}
import ceylon.language.meta.model {
	Class
}

import herd.gecon.core.api.transformer {
	Creator,
	Delegator
}

"Creator for [[HashMap]] using [[Entry]] iterable as arguments."
tagged ("Generic")
by ("Wojciech Potiopa")
shared class HashMapCreator() extends Creator<{Entry<Object,Anything>*},Map<>>() {
	shared actual Map<> create(Delegator delegator, {Entry<Object,Anything>*} arguments, Class<Map<>,Nothing> kind) {
		return kind.apply(linked, Hashtable(), arguments);
	}
	
	shared actual Matcher matcher => Matcher {
		Boolean predicate({<Object->Anything>*} source, Class<Map<Object,Anything>,Nothing> resultType) => resultType.declaration == `class HashMap`;
		priority = 1;
	};
}
