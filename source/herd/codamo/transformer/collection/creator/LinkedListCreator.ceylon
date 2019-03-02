import ceylon.collection {
	LinkedList
}
import ceylon.language.meta.model {
	Class
}

import herd.codamo.api.core.transformer {
	Creator,
	Delegator,
	Matchable
}
"Creator for [[LinkedList]] using any iterable as arguments"
tagged("Generic")
by("Wojciech Potiopa")
shared class LinkedListCreator() extends Creator<{Anything*},List<Anything>>() {
	shared actual List<Anything> create(Delegator delegator,Class<List<Anything>,Nothing> kind, {Anything*} arguments) {
		return kind.apply(arguments);
	}
	
	matchable => object satisfies Matchable<{Anything*},Class<List<Anything>>>{
		shared actual Boolean predicate({Anything*} source, Class<List<Anything>,Nothing> resultType) => resultType.declaration == `class LinkedList`;
		
		priority =1;
	};
	
}
