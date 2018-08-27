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
shared class ArrayCreator() satisfies  Creator<List<>,{Anything*}> {
	shared actual List<> create(Context context,Class<List<>,Nothing> kind, {Anything*} arguments) {
		return kind.apply(arguments);
	}
	matcher => object satisfies Creator<List<>,{Anything*}>.Matcher {
		shared actual Boolean match(Class<List<>,Nothing> kind, {Anything*} arguments) {
			return kind.declaration==`class Array`;
		}
		
		shared actual Integer priority => 1;
	};
}
