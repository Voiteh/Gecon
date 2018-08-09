import herd.convertx.core.api.component {
	Creator,
	Component
}
import ceylon.collection {
	TreeSet,
	naturalOrderTreeSet
}
import ceylon.language.meta.model {
	Class
}
service(`interface Component`)
shared class TreeSetCreator() satisfies  Creator<Set<>,{Anything*}> {
	shared actual Set<> create(Class<Set<>,Nothing> kind, {Anything*} arguments) {
		value factoryMethod = `function naturalOrderTreeSet`.apply<Set<>>(*kind.typeArgumentList);
		return factoryMethod.apply(*arguments);
	}
	matcher => object satisfies Creator<Set<>,{Anything*}>.Matcher {
		shared actual Boolean match(Class<Set<>,Nothing> kind, {Anything*} arguments) {
			return kind.declaration==`class TreeSet`;
		}
		
		shared actual Integer priority => 1;
	};
}