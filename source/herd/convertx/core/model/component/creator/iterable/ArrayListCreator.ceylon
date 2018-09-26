import ceylon.collection {
	ArrayList
}

import ceylon.language.meta.model {
	Class
}
import herd.convertx.api {
	Context,
	Creator,
	wired
}
import herd.convertx.api.operation {
	Creation
}

shared wired class ArrayListCreator() satisfies Creator<{Anything*},List<>> {
	shared actual List<> create(Context context,Class<List<>> kind, {Anything*} arguments) {
		return kind.apply(0, 1.5, arguments);
	}
	
	shared actual Creation<{Anything*},List<Anything>,List<Anything>>.Matcher? matcher => object satisfies Creation<{Anything*},List<Anything>,List<Anything>>.Matcher{
		shared actual Boolean match(Class<List<>> kind, {Anything*} arguments) {
			return kind.declaration==`class ArrayList`;
		}
		
		shared actual Integer priority => 1;
	};
}

