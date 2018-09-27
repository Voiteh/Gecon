
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
shared class ArrayCreator() satisfies  Creator<{Anything*},List<>> {
	shared actual List<> create(Delegator delegator,Class<List<>,Nothing> kind, {Anything*} arguments) {
		return kind.apply(arguments);
	}
	
	shared actual Creation<{Anything*},List<Anything>,List<Anything>>.Matcher? matcher => object satisfies Creation<{Anything*},List<Anything>,List<Anything>>.Matcher{
		shared actual Boolean match(Class<List<>,Nothing> kind, {Anything*} arguments) {
			return kind.declaration==`class Array`;
		}
		
		shared actual Integer priority => 1;	
	};
}

