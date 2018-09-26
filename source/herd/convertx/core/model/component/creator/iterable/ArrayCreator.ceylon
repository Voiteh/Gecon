
import ceylon.language.meta.model {
	Class
}
import herd.convertx.api {
	Context,
	Creator,
	wired
}
wired
shared class ArrayCreator() satisfies  Creator<{Anything*},List<>> {
	shared actual List<> create(Context context,Class<List<>,Nothing> kind, {Anything*} arguments) {
		return kind.apply(arguments);
	}
	matcher => object satisfies ArrayCreator.Matcher {
		shared actual Boolean match(Class<List<>,Nothing> kind, {Anything*} arguments) {
			return kind.declaration==`class Array`;
		}
		
		shared actual Integer priority => 1;
	};
}
