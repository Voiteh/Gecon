
import ceylon.language.meta.model {
	IntersectionType,
	Type
}
import herd.convertx.api {
	wired
}
import herd.convertx.api.operation {
	Convertion,
	Delegator
}
import herd.convertx.api.component {
	Converter
}

shared wired class IntersectionConverter() satisfies Converter<Anything, Anything>{
	shared actual Anything convert(Delegator delegator, Anything source, Type<Anything> resultType) {
		assert(is IntersectionType<> resultType);
		value resolvedType=delegator.resolve(source,resultType);
		return delegator.convert(source, resolvedType);
	}
	shared actual Convertion<Anything,Anything,Type<Anything>>.Matcher? matcher => object satisfies Convertion<Anything,Anything,Type<Anything>>.Matcher{
		shared actual Boolean match(Anything source, Type<Anything> resultType) => resultType is IntersectionType<>;
		
		shared actual Integer priority = 1;
	};
	
}

