import herd.convertx.core.api.component {
	Converter,
	wired
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	Type
}
import ceylon.language.meta {
	type
}
wired
shared class EnumeratedObjectToStringConverter() satisfies Converter<Object,String> {
	shared actual String convert(Context context, Object source, Type<String> resultType) => type(source).declaration.name;
	
	
	matcher => object satisfies EnumeratedObjectToStringConverter.Matcher{
		shared actual Boolean match(Object source, Type<String> resultType) => type(source).declaration.anonymous;
		
		shared actual Integer priority => 1;
		
		
	};
	
	
}