

import ceylon.language.meta.model {
	ClassOrInterface,
	Type
}
import herd.codamo.api.meta {
	Mapping,
	Relation
}
import ceylon.language.meta {
	type
}
import herd.codamo.api.operation {
	Convertion,
	Delegator,
	wired
}
import herd.codamo.api.component {
	Converter
}

shared wired class MetaConverter() satisfies Converter<Object,Object> {
	shared actual Object convert(Delegator delegator, Object source, Type<Object> resultType) {
			value resolvedType = delegator.resolve(source,resultType);
			value relation=delegator.convert(source->type(resolvedType), `Relation<>`);
			value mappingType=delegator.resolve(relation, `Mapping`);
			value mapping=delegator.create(mappingType,relation);
			return delegator.create(resolvedType, mapping);
	}
	
	shared actual Convertion<Object,Object,Type<Object>>.Matcher? matcher => object satisfies Convertion<Object,Object,Type<Object>>.Matcher{
		shared actual Boolean match(Object source, Type<Object> resultType) => resultType is ClassOrInterface<Object>;
		
		shared actual Integer priority = 0;
	};
}		


