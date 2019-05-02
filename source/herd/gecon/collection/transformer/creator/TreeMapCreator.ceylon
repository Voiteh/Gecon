import ceylon.collection {
	naturalOrderTreeMap,
	TreeMap
}
import ceylon.language.meta.model {
	Class
}

import herd.gecon.core.api.transformer {
	Creator,
	Delegator
}
import herd.type.support {
	flat
}

"Creator for [[TreeMap]] using any iterable as arguments"
tagged ("Generic")
by ("Wojciech Potiopa")
shared class TreeMapCreator() extends Creator<{Anything*},Map<>>() {
	shared actual Map<> create(Delegator delegator, {Anything*} arguments, Class<Map<>,Nothing> kind) {
		value factoryMethod = `function naturalOrderTreeMap`.apply<Map<>>(*kind.typeArgumentList);
		return factoryMethod.apply(*arguments);
	}
	
	shared actual Matcher matcher => Matcher {
		Boolean predicate({Anything*} source, Class<Map<Object,Anything>,Nothing> resultType) => flat.declarations(resultType.declaration).contains(`class TreeMap`);
		
		priority = 1;
	};
}
