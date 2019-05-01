import ceylon.language.meta.model {
	IntersectionType
}

import herd.gecon.api.transformer {
	Converter,
	Delegator
}

"Converts source intersection type value into result type. It required to have Resolver for intersection type, to select concrete intersection type class."
tagged ("Generic")
by ("Wojciech Potiopa")
shared class IntersectionConverter() extends Converter<Anything,Anything,IntersectionType<>>() {
	shared actual Anything convert(Delegator delegator, Anything source, IntersectionType<> resultType) {
		value resolvedType = delegator.resolve(source, resultType);
		return delegator.convert(source, resolvedType);
	}
	
	shared actual Matcher matcher => Matcher {
		Boolean predicate(Anything source, IntersectionType<Anything> resultType) => true;
		Integer priority = 1;
	};
}
