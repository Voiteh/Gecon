
import ceylon.language.meta.model {
	IntersectionType,
	Type
}

import herd.codamo.api.operation {
	Convertion,
	Delegator,
	provided
}
import herd.codamo.api.component {
	Converter
}

"Converts source intersection type value into result type. There will be required Resolver for intersection type."
tagged("Generic")
by("Wojciech Potiopa")
shared provided class IntersectionConverter() satisfies Converter<Anything, Anything>{
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

