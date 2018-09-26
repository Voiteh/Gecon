import herd.convertx.api {
	Context,
	Converter,
	wired
}
import ceylon.language.meta.model {
	Type
}
import herd.convertx.api.meta {
	extractObjectType
}


shared wired class SelfConverter() satisfies Converter<Anything,Anything> {
	shared actual Anything convert(Context context, Anything source, Type<Anything> resultType) {
		return source;
	}
	
	matcher => object satisfies SelfConverter.Matcher {
		shared actual Boolean match(Anything source, Type<Anything> resultType) => resultType.exactly(extractObjectType(source));
		
		shared actual Integer priority => runtime.maxIntegerValue;
	};
}
