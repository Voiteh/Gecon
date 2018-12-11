import ceylon.collection {
	naturalOrderTreeMap,
	TreeMap
}


import ceylon.language.meta.model {
	Class
}


import herd.codamo.api.core.transformer {
	Creator,
	provided,
	Creation,
	Delegator
}
import herd.codamo.api.core.util {
	typeHierarchy
}
"Creator for [[TreeMap]] using any iterable as arguments"
tagged("Generic")
by("Wojciech Potiopa")
shared provided class TreeMapCreator() satisfies Creator<{Anything*},Map<>> {
	shared actual Map<> create(Delegator delegator,Class<Map<>,Nothing> kind, {Anything*} arguments) {
		value factoryMethod = `function naturalOrderTreeMap`.apply<Map<>>(*kind.typeArgumentList);
		return factoryMethod.apply(*arguments);
	}
	
	shared actual Creation<{Anything*},Map<Object,Anything>,Map<Object,Anything>>.Matcher? matcher => object satisfies Creation<{Anything*},Map<Object,Anything>,Map<Object,Anything>>.Matcher{
		shared actual Boolean match(Class<Map<>,Nothing> kind, {Anything*} arguments) {
			return typeHierarchy(kind).findByDeclaration(`class TreeMap`) exists;
		}
		
		shared actual Integer priority => 1;
	};
}

