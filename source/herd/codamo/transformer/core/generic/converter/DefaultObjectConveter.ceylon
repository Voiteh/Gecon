

import ceylon.language.meta.model {
	ClassOrInterface
}

import herd.codamo.api.core.transformer {
	Converter,
	Delegator,
	Matchable,
	Relation
}
import herd.codamo.api.core.dictionary {
	Dictionary
}

"Converts a Source Object into Result type object. This [[Converter]] is heart of the Codamo. Usage of this component is expensive."
tagged("Generic")
by("Wojciech Potiopa")
shared class DefaultObjectConveter() extends Converter<Object,Object,ClassOrInterface<Object>>() {
	shared actual Object convert(Delegator delegator, Object source, ClassOrInterface<Object> resultType) {
			value resolvedType = delegator.resolve(source,resultType);
			value relation=delegator.create(`Relation<>`, source->resolvedType);
			value mappingType = delegator.resolve(relation, `Dictionary<>`);
			value mapping=delegator.map(relation, mappingType);
			return delegator.create(resolvedType, mapping);
	}
	
	matchable => object satisfies Matchable<Object,ClassOrInterface<Object>>{
		shared actual Boolean predicate(Object source, ClassOrInterface<Object> resultType) => true;
		
		shared actual Integer priority = 0;
		
		
	};
	
}		


