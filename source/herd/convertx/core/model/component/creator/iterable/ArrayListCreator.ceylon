import ceylon.collection {
	ArrayList
}
import herd.convertx.core.api.component {
	Creator,
	Component
}
import ceylon.language.meta.model {
	Class
}
service(`interface Component`)
shared class ArrayListCreator() satisfies Creator<List<>,{Anything*}> {
	shared actual List<> create(Class<List<>,Nothing> kind, {Anything*} arguments) {
		return kind.apply(0, 1.5, arguments);
	}
	matcher => object satisfies ArrayListCreator.Matcher {
		shared actual Boolean match(Class<List<>,Nothing> kind, {Anything*} arguments) {
			return kind.declaration==`class ArrayList`;
		}
		
		shared actual Integer priority => 1;
	};
}