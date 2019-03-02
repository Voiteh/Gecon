import herd.codamo.api.core.transformer {
	Converter,
	Delegator
}
import ceylon.language.meta.model {
	Type
}
shared class NullToStringConverter() extends Converter<Null,String,Type<String>>(){
	shared actual String convert(Delegator delegator, Null source, Type<String> resultType) => "null";
	
	
}