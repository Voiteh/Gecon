import herd.convertx.api.meta {
	Partialization,
	Relation,
	EntryPartialization
}
import ceylon.language.meta.model {
	Class,
	Type
}
import herd.convertx.api {
	wired
}
import herd.convertx.api.operation {
	Resolvance,
	Delegator
}
import herd.convertx.api.component {
	Resolver
}

wired
shared class EntryPartializationResolver() satisfies Resolver<Relation<Object,Map<String,Anything>>,Partialization> {
	shared actual Class<Partialization,Nothing> resolve(Delegator delegator, Relation<Object,Map<String,Anything>> type, Type<Partialization> outputType) => `EntryPartialization`;
	
	shared actual Resolvance<Relation<Object,Map<String,Anything>>,Partialization,Type<Partialization>>.Matcher? matcher => object satisfies Resolvance<Relation<Object,Map<String,Anything>>,Partialization,Type<Partialization>>.Matcher {
		shared actual Boolean match(Relation<Object,Map<String,Anything>> input, Type<Partialization> outputType) => true;
		
		shared actual Integer priority => 1;
	};
}
