

import ceylon.language.meta.model {
	ClassOrInterface,
	Type
}
import herd.codamo.api.core.meta {
	Mapping,
	Relation
}
import ceylon.language.meta {
	type
}

import herd.codamo.api.core.transformer {
	Converter,
	provided,
	Convertion,
	Delegator
}

"Converts a Source Object into Result type object. This [[Converter]] is heart of the Codamo. Usage of this component is expensive."
tagged("Generic")
by("Wojciech Potiopa")
shared provided class MetaConverter() satisfies Converter<Object,Object> {
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


