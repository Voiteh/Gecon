import ceylon.collection {
	LinkedList
}
import ceylon.language.meta.model {
	Class
}

import herd.gecon.core.api.transformer {
	Creator,
	Delegator}
"Creator for [[LinkedList]] using any iterable as arguments"
tagged("Generic")
by("Wojciech Potiopa")
shared class LinkedListCreator() extends Creator<{Anything*},List<Anything>>() {
	shared actual List<Anything> create(Delegator delegator, {Anything*} arguments,Class<List<Anything>,Nothing> kind) {
		return kind.apply(arguments);
	}
	
	shared actual Matcher matcher => Matcher{
		Boolean predicate({Anything*} source, Class<List<Anything>,Nothing> resultType) => resultType.declaration == `class LinkedList`;
		priority =1;
	};
	
}
