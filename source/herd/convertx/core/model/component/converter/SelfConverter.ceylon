import herd.convertx.api.component {
	Converter,
	wired
}
import herd.convertx.api {
	Context
}
import ceylon.language.meta.model {
	Type
}
import herd.convertx.api.meta {
	extractObjectType
}

wired
shared class SelfConverter() satisfies Converter<Anything,Anything> {
	shared actual Anything convert(Context context, Anything source, Type<Anything> resultType) {
		return source;
	}
	
	matcher => object satisfies SelfConverter.Matcher {
		shared actual Boolean match(Anything source, Type<Anything> resultType) => resultType.exactly(extractObjectType(source));
		
		shared actual Integer priority => runtime.maxIntegerValue;
	};
}
