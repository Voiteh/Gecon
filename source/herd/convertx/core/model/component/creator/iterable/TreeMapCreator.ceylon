import ceylon.collection {
	naturalOrderTreeMap,
	TreeMap
}
import herd.convertx.core.util {
	typeHierarchy
}
import herd.convertx.api.component {
	Creator,
	wired
}
import ceylon.language.meta.model {
	Class
}
import herd.convertx.api {
	Context
}
wired
shared class TreeMapCreator() satisfies Creator<{Anything*},Map<>> {
	shared actual Map<> create(Context context,Class<Map<>,Nothing> kind, {Anything*} arguments) {
		value factoryMethod = `function naturalOrderTreeMap`.apply<Map<>>(*kind.typeArgumentList);
		return factoryMethod.apply(*arguments);
	}
	matcher => object satisfies TreeMapCreator.Matcher {
		shared actual Boolean match(Class<Map<>,Nothing> kind, {Anything*} arguments) {
			return typeHierarchy(kind).findByDeclaration(`class TreeMap`) exists;
		}
		
		shared actual Integer priority => 1;
	};
}