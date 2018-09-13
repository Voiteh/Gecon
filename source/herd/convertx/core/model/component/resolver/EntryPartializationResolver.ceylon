import herd.convertx.core.api.component {
	Resolver,
	wired
}
import herd.convertx.core.api.meta {
	Partialization,
	Relation
}
import ceylon.language.meta.model {
	Class,
	Type
}
import herd.convertx.core.api {
	Context
}

import herd.convertx.core.model.meta {
	EntryPartialization
}
wired
shared class EntryPartializationResolver() satisfies Resolver<Relation<Object,Map<String,Anything>>,Partialization>{
	shared actual Class<Partialization,Nothing> resolve(Context context, Relation<Object,Map<String,Anything>> type, Type<Partialization> outputType) =>`EntryPartialization`;
	

	matcher=> object satisfies EntryPartializationResolver.Matcher{
		shared actual Boolean match(Relation<Object,Map<String,Anything>> input, Type<Partialization> outputType) => true;
		
		shared actual Integer priority => 1;
		
		
	};
		
}