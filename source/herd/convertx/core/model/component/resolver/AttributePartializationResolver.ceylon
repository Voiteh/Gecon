import herd.convertx.core.api.component {
	Resolver,
	Component
}

import ceylon.language.meta.model {
	Type,
	Class,
	ClassOrInterface
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.meta.support {
	AttributePartialization
}
import herd.convertx.core.api.meta {
	Partialization
}

service(`interface Component`)
shared class AttributePartializationResolver() satisfies Resolver<Partialization,Object->Type<Object>> {
	shared actual Class<AttributePartialization,Nothing> resolve(Context context, Object->Type<Object> source, ClassOrInterface<Partialization> outputType) => `AttributePartialization`;
	
	matcher => object satisfies AttributePartializationResolver.Matcher{
		shared actual Boolean match(Object->Type<Object> input, ClassOrInterface<Partialization> outputType) => true;
		
		shared actual Integer priority => 0;
		
		
	};
}

