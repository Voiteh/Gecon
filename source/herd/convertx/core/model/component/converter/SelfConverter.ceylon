import herd.convertx.core.api.component {
	Component,
	Converter
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	Type
}
import ceylon.language.meta {
	type
}

service (`interface Component`)
shared class SelfConverter() satisfies Converter<Anything,Anything> {
	shared actual Anything convert(Context context, Anything source, Type<Anything> resultType) {
		return source;
	}
	
	matcher => object satisfies SelfConverter.Matcher {
		shared actual Boolean match(Anything source, Type<Anything> resultType) => resultType.exactly(type(source));
		
		shared actual Integer priority => runtime.maxIntegerValue;
	};
}
