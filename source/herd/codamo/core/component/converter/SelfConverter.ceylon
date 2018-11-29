
import ceylon.language.meta.model {
	Type
}
import herd.codamo.api.meta {
	extractObjectType
}
import herd.codamo.api.operation {
	Convertion,
	Delegator,
	provided
}
import herd.codamo.api.component {
	Converter
}
"If provided Source object value, is the same type as Result type, returns source object. "
tagged("Generic")
by("Wojciech Potiopa")
shared provided class SelfConverter() satisfies Converter<Anything,Anything> {
	shared actual Anything convert(Delegator delegator, Anything source, Type<Anything> resultType) {
		return source;
	}
	shared actual Convertion<Anything,Anything,Type<Anything>>.Matcher? matcher => object satisfies Convertion<Anything,Anything,Type<Anything>>.Matcher{
		shared actual Boolean match(Anything source, Type<Anything> resultType) => resultType.exactly(extractObjectType(source));
		
		shared actual Integer priority => runtime.maxIntegerValue;
	};
}
