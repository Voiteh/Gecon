import herd.convertx.core.api.component {
	Converter,
	Component
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	Type
}
service(`interface Component`)
shared class BooleanToStringConverter() satisfies Converter<Boolean,String>  {
	shared actual String convert(Context context, Boolean source, Type<String> resultType) =>  source.string;
	
}
