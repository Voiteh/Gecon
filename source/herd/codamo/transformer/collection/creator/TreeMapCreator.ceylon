import ceylon.collection {
	naturalOrderTreeMap,
	TreeMap
}
import ceylon.language.meta.model {
	Class
}

import herd.codamo.api.core.transformer {
	Creator,
	Delegator,
	Matchable
}
import herd.type.support {
	flat
}
"Creator for [[TreeMap]] using any iterable as arguments"
tagged("Generic")
by("Wojciech Potiopa")
shared class TreeMapCreator() extends Creator<{Anything*},Map<>>() {
	shared actual Map<> create(Delegator delegator,Class<Map<>,Nothing> kind, {Anything*} arguments) {
		value factoryMethod = `function naturalOrderTreeMap`.apply<Map<>>(*kind.typeArgumentList);
		return factoryMethod.apply(*arguments);
	}
	
	matchable => object satisfies Matchable<{Anything*},Class<Map<Object,Anything>>>{
		shared actual Boolean predicate({Anything*} source, Class<Map<Object,Anything>,Nothing> resultType) => flat.declarations(resultType.declaration).contains(`class TreeMap`);
		
		priority =1;
	};
	
	
}

