import ceylon.language.meta.model {
	Class
}

import herd.gecon.api.transformer {
	Creator,
	Delegator
}

"Creator for [[Entry]] using iterable as arguments, only first two items will be taken in consideration. Arguments size must be equals 2."
tagged ("Generic")
by ("Wojciech Potiopa")
shared class EntryCreator() extends Creator<{Anything*},Entry<Object,Anything>>() {
	shared actual Object->Anything create(Delegator delegator, {Anything*} arguments, Class<Object->Anything,Nothing> kind) {
		value key = arguments.first;
		assert (exists key);
		value item = arguments.rest.first;
		return kind.apply(key, item);
	}
	
	shared actual Matcher matcher => Matcher {
		Boolean predicate({Anything*} source, Class<Object->Anything,Nothing> resultType) => source.size == 2;
		Integer priority = 1;
	};
}
