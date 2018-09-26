
import ceylon.language.meta.model {
	Class,
	Type
}
import herd.convertx.api {
	wired,
	Context,
	Resolver
}

import herd.convertx.api.meta {
	Partialization,
	Relation,
	AttributePartialization
}



wired
shared class AttributePartializationResolver() satisfies Resolver<Relation<Object,Object>,Partialization> {
	shared actual Class<AttributePartialization,Nothing> resolve(Context context, Relation<Object,Object> source, Type<Partialization> outputType) => `AttributePartialization`;
	
	matcher => object satisfies AttributePartializationResolver.Matcher{
		shared actual Boolean match(Relation<Object,Object> input, Type<Partialization> outputType) => true;
		
		shared actual Integer priority => 0;
		
		
	};
}

