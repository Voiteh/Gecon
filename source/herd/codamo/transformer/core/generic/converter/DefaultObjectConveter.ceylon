

import ceylon.language.meta.model {
	ClassOrInterface
}

import herd.codamo.api.core.transformer {
	Converter,
	Delegator,
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
	
	shared actual Matcher matcher => Matcher{
		Boolean predicate(Object source, ClassOrInterface<Object> resultType) => true;
		Integer priority = 0;
	};
	
}		


