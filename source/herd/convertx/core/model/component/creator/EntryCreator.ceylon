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
wired
shared class EntryCreator() satisfies Creator<Entry<Object,Anything>,{Anything*}> {
	shared actual Object->Anything create(Context context,Class<Object->Anything,Nothing> kind, {Anything*} arguments) {
		value key = arguments.first;
		assert (exists key);
		value item = arguments.rest.first;
		return kind.apply(key, item);
	}
	
	matcher => object satisfies EntryCreator.Matcher{
		shared actual Boolean match(Class<Object->Anything,Nothing> kind, {Anything*} arguments) => arguments.size==2;
		
		shared actual Integer priority => 1;
		
		
	};
}