import ceylon.collection {
	naturalOrderTreeMap,
	TreeMap
}
import herd.convertx.core.util {
	typeHierarchy
}

import ceylon.language.meta.model {
	Class
}
import herd.convertx.api {
	wired
}
import herd.convertx.api.operation {
	Creation,
	Delegator
}
import herd.convertx.api.component {
	Creator
}
wired
shared class TreeMapCreator() satisfies Creator<{Anything*},Map<>> {
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

