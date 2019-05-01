import ceylon.collection {
	ArrayList
}
import ceylon.language.meta.model {
	Class
}

import herd.codamo.api.core.transformer {
	Creator,
	Delegator}


"Creator for [[ArrayList]] using any iterable as arguments"
tagged("Generic")
by("Wojciech Potiopa")
shared class ArrayListCreator() extends Creator<{Anything*},List<>>() {
	shared actual List<> create(Delegator delegator, {Anything*} arguments,Class<List<>> kind) {
		return kind.apply(0, 1.5, arguments);
	}
	
	shared actual Matcher matcher => Matcher{
		Boolean predicate({Anything*} source, Class<List<Anything>,Nothing> resultType) => resultType.declaration==`class ArrayList`;
		Integer priority = 1;
	};
	
}

