import ceylon.collection {
	ArrayList
}

import ceylon.language.meta.model {
	Class
}

import herd.codamo.api.operation {
	Creation,
	Delegator,
	wired
}
import herd.codamo.api.component {
	Creator
}


"Creator for [[ArrayList]] using any iterable as arguments"
tagged("Generic")
by("Wojciech Potiopa")
shared wired class ArrayListCreator() satisfies Creator<{Anything*},List<>> {
	shared actual List<> create(Delegator delegator,Class<List<>> kind, {Anything*} arguments) {
		return kind.apply(0, 1.5, arguments);
	}
	
	shared actual Creation<{Anything*},List<Anything>,List<Anything>>.Matcher? matcher => object satisfies Creation<{Anything*},List<Anything>,List<Anything>>.Matcher{
		shared actual Boolean match(Class<List<>> kind, {Anything*} arguments) {
			return kind.declaration==`class ArrayList`;
		}
		
		shared actual Integer priority => 1;
	};
}

