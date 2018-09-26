import herd.convertx.api {
	Context,
	Converter,
	wired
}
import ceylon.language.meta.model {
	Type
}
import ceylon.language.meta {
	type
}
import herd.convertx.api.operation {
	Convertion
}

shared wired class EnumeratedObjectToJsonStringConverter() satisfies Converter<Object,String> {
	shared actual String convert(Context context, Object source, Type<String> resultType) => type(source).declaration.name;
	
	

	shared actual Convertion<Object,String,Type<String>>.Matcher? matcher => object satisfies Convertion<Object,String,Type<String>>.Matcher{
		
		shared actual Boolean match(Object source, Type<String> resultType) => type(source).declaration.anonymous;
		
		shared actual Integer priority => 1;
	};
			
}		
