
import ceylon.language.meta.model {
	Type
}
import herd.codamo.api.meta {
	extractObjectType
}
import herd.codamo.api.operation {
	Convertion,
	Delegator,
	wired
}
import herd.codamo.api.component {
	Converter
}


shared wired class SelfConverter() satisfies Converter<Anything,Anything> {
	shared actual Anything convert(Delegator delegator, Anything source, Type<Anything> resultType) {
		return source;
	}
	shared actual Convertion<Anything,Anything,Type<Anything>>.Matcher? matcher => object satisfies Convertion<Anything,Anything,Type<Anything>>.Matcher{
		shared actual Boolean match(Anything source, Type<Anything> resultType) => resultType.exactly(extractObjectType(source));
		
		shared actual Integer priority => runtime.maxIntegerValue;
	};
}