import herd.codamo.api.core.transformer {
	Converter,
	Delegator
}
import ceylon.language.meta.model {
	Type
}
shared class StringToNullConverter() extends Converter<String,Null,Type<Null>>(){
	shared actual Null convert(Delegator delegator, String source, Type<Null> resultType) => null;
	
}