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
shared class ByteToStringConverter() satisfies Converter<Byte,String>  {
	shared actual String convert(Context context, Byte source, Type<String> resultType) =>  source.string;
	
}