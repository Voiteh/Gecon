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
	ClassOrInterface
}
import herd.convertx.core.api {
	Context
}

import herd.convertx.core.model.meta {
	EntryPartialization
}
wired
shared class EntryPartializationResolver() satisfies Resolver<Partialization,Relation<Object,Map<String,Anything>>>{
	shared actual Class<Partialization,Nothing> resolve(Context context, Relation<Object,Map<String,Anything>> type, ClassOrInterface<Partialization> outputType) =>`EntryPartialization`;
	

	matcher=> object satisfies EntryPartializationResolver.Matcher{
		shared actual Boolean match(Relation<Object,Map<String,Anything>> input, ClassOrInterface<Partialization> outputType) => true;
		
		shared actual Integer priority => 1;
		
		
	};
		
}