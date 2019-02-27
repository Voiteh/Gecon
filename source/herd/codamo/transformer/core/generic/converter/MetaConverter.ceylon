

import ceylon.language.meta {
	type
}
import ceylon.language.meta.model {
	ClassOrInterface
}

import herd.codamo.api.core.meta {
	Mapping,
	Relation
}
import herd.codamo.api.core.transformer {
	Converter,
	Delegator,
	Matchable
}

"Converts a Source Object into Result type object. This [[Converter]] is heart of the Codamo. Usage of this component is expensive."
tagged("Generic")
by("Wojciech Potiopa")
shared class MetaConverter() extends Converter<Object,Object,ClassOrInterface<Object>>() {
	shared actual Object convert(Delegator delegator, Object source, ClassOrInterface<Object> resultType) {
			value resolvedType = delegator.resolve(source,resultType);
			value relation=delegator.convert(source->type(resolvedType), `Relation<>`);
			value mappingType=delegator.resolve(relation, `Mapping`);
			value mapping=delegator.create(mappingType,relation);
			return delegator.create(resolvedType, mapping);
	}
	
	matchable => object satisfies Matchable<Object,ClassOrInterface<Object>>{
		shared actual Boolean predicate(Object source, ClassOrInterface<Object> resultType) => true;
		
		shared actual Integer priority = 0;
		
		
	};
	
}		


