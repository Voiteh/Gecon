import herd.codamo.api.core.transformer {
	Converter,
	Delegator
}
import ceylon.language.meta.model {
	Type
}
shared class NullToStringConverter() satisfies Converter<Null,String>{
	shared actual String convert(Delegator delegator, Null source, Type<String> resultType) => "null";
	
	
}