
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
wired
shared class ArrayCreator() satisfies  Creator<{Anything*},List<>> {
	shared actual List<> create(Context context,Class<List<>,Nothing> kind, {Anything*} arguments) {
		return kind.apply(arguments);
	}
	
	shared actual Creation<{Anything*},List<Anything>,List<Anything>>.Matcher? matcher => object satisfies Creation<{Anything*},List<Anything>,List<Anything>>.Matcher{
		shared actual Boolean match(Class<List<>,Nothing> kind, {Anything*} arguments) {
			return kind.declaration==`class Array`;
		}
		
		shared actual Integer priority => 1;	
	};
}

