
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

shared wired class EntryCreator() satisfies Creator<{Anything*},Entry<Object,Anything>> {
	shared actual Object->Anything create(Context context,Class<Object->Anything,Nothing> kind, {Anything*} arguments) {
		value key = arguments.first;
		assert (exists key);
		value item = arguments.rest.first;
		return kind.apply(key, item);
	}

	shared actual Creation<{Anything*},Object->Anything,Object->Anything>.Matcher? matcher => object satisfies Creation<{Anything*},Object->Anything,Object->Anything>.Matcher {
		shared actual Boolean match(Class<Object->Anything,Nothing> kind, {Anything*} arguments) => arguments.size==2;
		
		shared actual Integer priority = 1;
	};
}
