import ceylon.collection {
	Hashtable,
	HashSet,
	linked
}
import ceylon.language.meta.model {
	Class
}

import herd.codamo.api.core.transformer {
	Creator,
	Delegator,
	Matchable
}
"Creator for [[HashSet]] using any iterable as arguments"
tagged("Generic")
by("Wojciech Potiopa")
shared class HashSetCreator() extends Creator<{Anything*},Set<>>() {
	shared actual Set<> create(Delegator delegator, {Anything*} arguments,Class<Set<>,Nothing> kind) {
		return kind.apply(linked, Hashtable(), arguments);
	}
	
	matchable => object satisfies Matchable<{Anything*},Class<Set<>,Nothing>>{
		shared actual Boolean predicate({Anything*} source, Class<Set<Object>,Nothing> resultType) => resultType.declaration==`class HashSet`;
		
		priority =1;
		
	};

}


