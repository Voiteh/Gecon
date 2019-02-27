import ceylon.collection {
	ArrayList
}
import ceylon.language.meta.model {
	Class
}

import herd.codamo.api.core.transformer {
	Creator,
	Delegator,
	Matchable
}


"Creator for [[ArrayList]] using any iterable as arguments"
tagged("Generic")
by("Wojciech Potiopa")
shared class ArrayListCreator() extends Creator<{Anything*},List<>>() {
	shared actual List<> create(Delegator delegator,Class<List<>> kind, {Anything*} arguments) {
		return kind.apply(0, 1.5, arguments);
	}
	
	shared actual Matchable<{Anything*},Class<List<Anything>,Nothing>>? matchable => object satisfies Matchable<{Anything*},Class<List<Anything>,Nothing>>{
		
		shared actual Integer priority => 1;
		shared actual Boolean predicate({Anything*} source, Class<List<Anything>,Nothing> resultType) => resultType.declaration==`class ArrayList`;
			
	};
}

