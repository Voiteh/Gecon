
import ceylon.collection {
	TreeSet,
	naturalOrderTreeSet
}
import ceylon.language.meta.model {
	Class
}

import herd.codamo.api.core.transformer {
	Creator,
	Delegator,
	Matchable
}

shared class TreeSetCreator() extends Creator<{Anything*},Set<>>() {
	shared actual Set<> create(Delegator delegator, {Anything*} arguments,Class<Set<>,Nothing> kind) {
		value factoryMethod = `function naturalOrderTreeSet`.apply<Set<>>(*kind.typeArgumentList);
		return factoryMethod.apply(*arguments);
	}
	matchable => object satisfies Matchable<{Anything*},Class<Set<>>>{
		shared actual Boolean predicate({Anything*} source, Class<Set<Object>,Nothing> resultType) => resultType.declaration==`class TreeSet`;
		
		shared actual Integer priority =1;
		
		
	};
	

}

