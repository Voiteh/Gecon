
import ceylon.language.meta {
	type
}
import ceylon.language.meta.model {
	Type
}

import herd.gecon.api.transformer {
	Converter,
	Delegator
}

"Converts enumerated objects to string. The implementation is naive but can handle simple constant values."
by("Wojciech Potiopa")
shared class EnumeratedObjectToJsonStringConverter() extends Converter<Object,String,Type<String>>() {
	shared actual String convert(Delegator delegator, Object source, Type<String> resultType) => type(source).declaration.name;
	
	shared actual Matcher matcher => Matcher {
		Boolean predicate(Object source, Type<String> resultType) => type(source).declaration.anonymous;
		Integer priority =1;
	};
			
}		
