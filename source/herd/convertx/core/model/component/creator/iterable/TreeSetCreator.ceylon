import herd.convertx.core.api.component {
	Creator,
	wired
}
import ceylon.collection {
	TreeSet,
	naturalOrderTreeSet
}
import ceylon.language.meta.model {
	Class
}
import herd.convertx.core.api {
	Context
}
wired
shared class TreeSetCreator() satisfies  Creator<{Anything*},Set<>> {
	shared actual Set<> create(Context context,Class<Set<>,Nothing> kind, {Anything*} arguments) {
		value factoryMethod = `function naturalOrderTreeSet`.apply<Set<>>(*kind.typeArgumentList);
		return factoryMethod.apply(*arguments);
	}
	matcher => object satisfies TreeSetCreator.Matcher {
		shared actual Boolean match(Class<Set<>,Nothing> kind, {Anything*} arguments) {
			return kind.declaration==`class TreeSet`;
		}
		
		shared actual Integer priority => 1;
	};
}