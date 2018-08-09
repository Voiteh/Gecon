import ceylon.language.meta.model {
	Type
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.component {
	Converter,
	Component
}
service(`interface Component`)
shared class IntegerToStringConverter() satisfies Converter<Integer,String>  {
	shared actual String convert(Context context, Integer source, Type<String> resultType) =>  source.string;
	
}