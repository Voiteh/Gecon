import herd.convertx.api.component {
	Converter,
	wired
}
import herd.convertx.api {
	Context
}
import ceylon.language.meta.model {
	Type
}
import ceylon.language.meta {
	type
}
wired
shared class EnumeratedObjectToJsonStringConverter() satisfies Converter<Object,String> {
	shared actual String convert(Context context, Object source, Type<String> resultType) => type(source).declaration.name;
	
	
	matcher => object satisfies EnumeratedObjectToJsonStringConverter.Matcher{
		shared actual Boolean match(Object source, Type<String> resultType) => type(source).declaration.anonymous;
		
		shared actual Integer priority => 1;
		
		
	};
	
	
}