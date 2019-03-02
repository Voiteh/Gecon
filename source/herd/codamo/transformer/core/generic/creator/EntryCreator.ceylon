
import ceylon.language.meta.model {
	Class
}

import herd.codamo.api.core.transformer {
	Creator,
	Delegator,
	Matchable
}

"Creator for [[Entry]] using iterable as arguments, only first two items will be taken in consideration. Arguments size must be equals 2."
tagged("Generic")
by("Wojciech Potiopa")
shared class EntryCreator() extends Creator<{Anything*},Entry<Object,Anything>>() {
	shared actual Object->Anything create(Delegator delegator,Class<Object->Anything,Nothing> kind, {Anything*} arguments) {
		value key = arguments.first;
		assert (exists key);
		value item = arguments.rest.first;
		return kind.apply(key, item);
	}

	matchable => object satisfies Matchable<{Anything*},Class<Object->Anything,Nothing>>{
		shared actual Boolean predicate({Anything*} source, Class<Object->Anything,Nothing> resultType) => source.size==2;
		
		shared actual Integer priority = 1;
		
		
	};
}
