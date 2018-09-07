import herd.convertx.core.api.component {
	Resolver,
	wired
}

import ceylon.language.meta.model {
	Class,
	ClassOrInterface
}
import herd.convertx.core.api {
	Context
}

import herd.convertx.core.api.meta {
	Partialization,
	Relation,
	AttributePartialization
}


wired
shared class AttributePartializationResolver() satisfies Resolver<Partialization,Relation<Object,Object>> {
	shared actual Class<AttributePartialization,Nothing> resolve(Context context, Relation<Object,Object> source, ClassOrInterface<Partialization> outputType) => `AttributePartialization`;
	
	matcher => object satisfies AttributePartializationResolver.Matcher{
		shared actual Boolean match(Relation<Object,Object> input, ClassOrInterface<Partialization> outputType) => true;
		
		shared actual Integer priority => 0;
		
		
	};
}

