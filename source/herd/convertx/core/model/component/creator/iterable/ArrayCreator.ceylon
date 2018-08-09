import herd.convertx.core.api.component {
	Creator,
	Component
}
import ceylon.language.meta.model {
	Class
}
service(`interface Component`)
shared class ArrayCreator() satisfies  Creator<List<>,{Anything*}> {
	shared actual List<> create(Class<List<>,Nothing> kind, {Anything*} arguments) {
		return kind.apply(arguments);
	}
	matcher => object satisfies Creator<List<>,{Anything*}>.Matcher {
		shared actual Boolean match(Class<List<>,Nothing> kind, {Anything*} arguments) {
			return kind.declaration==`class Array`;
		}
		
		shared actual Integer priority => 1;
	};
}
