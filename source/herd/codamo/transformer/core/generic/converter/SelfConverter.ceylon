
import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.core.meta {
	extractObjectType
}
import herd.codamo.api.core.transformer {
	Converter,
	Delegator,
	Matchable
}
"If provided Source object value, is the same type as Result type, returns source object. "
tagged("Generic")
by("Wojciech Potiopa")
shared class SelfConverter() extends Converter<Anything,Anything>() {
	shared actual Anything convert(Delegator delegator, Anything source, Type<Anything> resultType) {
		return source;
	}
	
	matchable => object satisfies Matchable<Anything,Type<>>{
		shared actual Boolean predicate(Anything source, Type<Anything> resultType) => resultType.exactly(extractObjectType(source));
		
		shared actual Integer priority =runtime.maxIntegerValue;
		
		
	};
	

}
