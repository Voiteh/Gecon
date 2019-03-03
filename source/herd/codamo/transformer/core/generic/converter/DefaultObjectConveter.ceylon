

import ceylon.language.meta.model {
	ClassOrInterface,
	Attribute
}

import herd.codamo.api.core.transformer {
	Converter,
	Delegator,
	Matchable
}

"Converts a Source Object into Result type object. This [[Converter]] is heart of the Codamo. Usage of this component is expensive."
tagged("Generic")
by("Wojciech Potiopa")
shared class DefaultObjectConveter() extends Converter<Object,Object,ClassOrInterface<Object>>() {
	shared actual Object convert(Delegator delegator, Object source, ClassOrInterface<Object> resultType) {
			value resolvedType = delegator.resolve(source,resultType);
			value mapping=delegator.map<Attribute<>>(source, resolvedType);
			value converterMapping=map(mapping.map((Attribute<Nothing,Anything,Nothing> key -> Anything item) => key->delegator.convert(item, key.type)));
			return delegator.create(resolvedType, converterMapping);
	}
	
	matchable => object satisfies Matchable<Object,ClassOrInterface<Object>>{
		shared actual Boolean predicate(Object source, ClassOrInterface<Object> resultType) => true;
		
		shared actual Integer priority = 0;
		
		
	};
	
}		


