
import ceylon.language.meta.model {
	Class
}

import herd.codamo.api.core.transformer {
	Delegator,
	Creator,
	Matchable
}

"Creator for [[Array]], using any iterable as argumets."
tagged("Generic")
by("Wojciech Potiopa")
shared class ArrayCreator() extends Creator<{Anything*},List<>>() {
	shared actual List<> create(Delegator delegator,Class<List<>,Nothing> kind, {Anything*} arguments) {
		return kind.apply(arguments);
	}
	
	matchable => object satisfies Matchable<{Anything*},Class<List<>>>{
		shared actual Boolean predicate({Anything*} source, Class<List<Anything>,Nothing> resultType) => resultType.declaration==`class Array`;
		
		shared actual Integer priority =1;
		
		
	};
	
}

