
import ceylon.language.meta.model {
	Type
}
import ceylon.language.meta {
	type
}

import herd.codamo.api.core.transformer {
	Converter,
	provided,
	Convertion,
	Delegator
}

"Converts enumerated objects to string. The implementation is naive but can handle simple constant values."
by("Wojciech Potiopa")
shared provided class EnumeratedObjectToJsonStringConverter() satisfies Converter<Object,String> {
	shared actual String convert(Delegator delegator, Object source, Type<String> resultType) => type(source).declaration.name;
	
	

	shared actual Convertion<Object,String,Type<String>>.Matcher? matcher => object satisfies Convertion<Object,String,Type<String>>.Matcher{
		
		shared actual Boolean match(Object source, Type<String> resultType) => type(source).declaration.anonymous;
		
		shared actual Integer priority => 1;
	};
			
}		
