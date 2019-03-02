
import ceylon.language.meta.model {
	IntersectionType
}

import herd.codamo.api.core.transformer {
	Converter,
	Delegator,
	Matchable
}

"Converts source intersection type value into result type. It required to have Resolver for intersection type, to select concrete intersection type class."
tagged("Generic")
by("Wojciech Potiopa")
shared class IntersectionConverter() extends Converter<Anything, Anything,IntersectionType<>>(){
	shared actual Anything convert(Delegator delegator, Anything source, IntersectionType<> resultType) {
		value resolvedType=delegator.resolve(source,resultType);
		return delegator.convert(source, resolvedType);
	}
	
	matchable => object satisfies Matchable<Anything,IntersectionType<>>{
		shared actual Boolean predicate(Anything source, IntersectionType<Anything> resultType) => true;
		
		shared actual Integer priority = 1;
		
		 
	};
	
	

}

