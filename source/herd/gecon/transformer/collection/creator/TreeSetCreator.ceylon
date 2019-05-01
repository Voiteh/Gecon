import ceylon.collection {
	TreeSet,
	naturalOrderTreeSet
}
import ceylon.language.meta.model {
	Class
}

import herd.gecon.api.transformer {
	Creator,
	Delegator
}

shared class TreeSetCreator() extends Creator<{Anything*},Set<>>() {
	shared actual Set<> create(Delegator delegator, {Anything*} arguments, Class<Set<>,Nothing> kind) {
		value factoryMethod = `function naturalOrderTreeSet`.apply<Set<>>(*kind.typeArgumentList);
		return factoryMethod.apply(*arguments);
	}
	shared actual Matcher matcher => Matcher {
		Boolean predicate({Anything*} source, Class<Set<Object>,Nothing> resultType) => resultType.declaration == `class TreeSet`;
		
		Integer priority = 1;
	};
}
