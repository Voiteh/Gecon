
import ceylon.language.meta.model {
	Type
}


import herd.gecon.api.transformer {
	Converter,
	Delegator
}
import herd.gecon.api.util {
	extractObjectType
}
"If provided Source object value, is the same type as Result type, returns source object. "
tagged("Generic")
by("Wojciech Potiopa")
shared class SelfConverter() extends Converter<Anything,Anything,Type<Anything>>() {
	shared actual Anything convert(Delegator delegator, Anything source, Type<Anything> resultType) {
		return source;
	}
	
	shared actual Matcher matcher => Matcher{
		Boolean predicate(Anything source, Type<Anything> resultType) => resultType.exactly(extractObjectType(source));
		Integer priority =runtime.maxIntegerValue;
	};

}
