import ceylon.collection {
	naturalOrderTreeMap,
	TreeMap
}
import herd.convertx.core.util {
	typeHierarchy
}
import herd.convertx.core.api.component {
	Creator,
	Component
}
import ceylon.language.meta.model {
	Class
}
import herd.convertx.core.api {
	Context
}
service(`interface Component`)
shared class TreeMapCreator() satisfies Creator<Map<>,{Anything*}> {
	shared actual Map<> create(Context context,Class<Map<>,Nothing> kind, {Anything*} arguments) {
		value factoryMethod = `function naturalOrderTreeMap`.apply<Map<>>(*kind.typeArgumentList);
		return factoryMethod.apply(*arguments);
	}
	matcher => object satisfies Creator<Map<>,{Anything*}>.Matcher {
		shared actual Boolean match(Class<Map<>,Nothing> kind, {Anything*} arguments) {
			return typeHierarchy(kind).findByDeclaration(`class TreeMap`) exists;
		}
		
		shared actual Integer priority => 1;
	};
}