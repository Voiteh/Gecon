import ceylon.language.meta.model {
	Class,
	Type
}
import herd.convertx.api {
	wired
}

import herd.convertx.api.meta {
	Partialization,
	Relation,
	AttributePartialization
}
import herd.convertx.api.operation {
	Resolvance,
	Delegator
}
import herd.convertx.api.component {
	Resolver
}

wired
shared class AttributePartializationResolver() satisfies Resolver<Relation<Object,Object>,Partialization> {
	shared actual Class<AttributePartialization,Nothing> resolve(Delegator delegator, Relation<Object,Object> source, Type<Partialization> outputType) => `AttributePartialization`;
	
	shared actual Resolvance<Relation<Object,Object>,Partialization,Type<Partialization>>.Matcher? matcher => object satisfies Resolvance<Relation<Object,Object>,Partialization,Type<Partialization>>.Matcher {
		shared actual Boolean match(Relation<Object,Object> input, Type<Partialization> outputType) => true;
		
		shared actual Integer priority => 0;
	};
}
