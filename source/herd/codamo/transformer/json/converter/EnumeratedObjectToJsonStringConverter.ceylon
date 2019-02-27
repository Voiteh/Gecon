
import ceylon.language.meta {
	type
}
import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.core.transformer {
	Converter,
	Delegator,
	Matchable
}

"Converts enumerated objects to string. The implementation is naive but can handle simple constant values."
by("Wojciech Potiopa")
shared class EnumeratedObjectToJsonStringConverter() extends Converter<Object,String,Type<String>>() {
	shared actual String convert(Delegator delegator, Object source, Type<String> resultType) => type(source).declaration.name;
	
	
	matchable => object satisfies Matchable<Object,Type<String>>{
		shared actual Boolean predicate(Object source, Type<String> resultType) => type(source).declaration.anonymous;
		
		shared actual Integer priority =1;
		
		
	};
	
			
}		
