import ceylon.collection {
	ArrayList
}
import herd.convertx.core.api.component {
	Creator,
	wired
}
import ceylon.language.meta.model {
	Class
}
import herd.convertx.core.api {
	Context
}

shared wired class ArrayListCreator() satisfies Creator<{Anything*},List<>> {
	shared actual List<> create(Context context,Class<List<>> kind, {Anything*} arguments) {
		return kind.apply(0, 1.5, arguments);
	}
	matcher => object satisfies ArrayListCreator.Matcher {
		shared actual Boolean match(Class<List<>> kind, {Anything*} arguments) {
			return kind.declaration==`class ArrayList`;
		}
		
		shared actual Integer priority => 1;
	};
}