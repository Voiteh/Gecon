
import ceylon.collection {
	TreeSet,
	naturalOrderTreeSet
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
shared class TreeSetCreator() satisfies  Creator<{Anything*},Set<>> {
	shared actual Set<> create(Delegator delegator,Class<Set<>,Nothing> kind, {Anything*} arguments) {
		value factoryMethod = `function naturalOrderTreeSet`.apply<Set<>>(*kind.typeArgumentList);
		return factoryMethod.apply(*arguments);
	}
	shared actual Creation<{Anything*},Set<Object>,Set<Object>>.Matcher? matcher => object satisfies Creation<{Anything*},Set<Object>,Set<Object>>.Matcher{
		shared actual Boolean match(Class<Set<>,Nothing> kind, {Anything*} arguments) {
			return kind.declaration==`class TreeSet`;
		}
		
		shared actual Integer priority => 1;
	};
}

