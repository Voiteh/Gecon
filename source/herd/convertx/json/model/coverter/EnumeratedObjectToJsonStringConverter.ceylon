import herd.convertx.api {
	wired
}
import ceylon.language.meta.model {
	Type
}
import ceylon.language.meta {
	type
}
import herd.convertx.api.operation {
	Convertion,
	Delegator
}
import herd.convertx.api.component {
	Converter
}

shared wired class EnumeratedObjectToJsonStringConverter() satisfies Converter<Object,String> {
	shared actual String convert(Delegator delegator, Object source, Type<String> resultType) => type(source).declaration.name;
	
	

	shared actual Convertion<Object,String,Type<String>>.Matcher? matcher => object satisfies Convertion<Object,String,Type<String>>.Matcher{
		
		shared actual Boolean match(Object source, Type<String> resultType) => type(source).declaration.anonymous;
		
		shared actual Integer priority => 1;
	};
			
}		
