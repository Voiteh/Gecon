import ceylon.language.meta.model {
	Type
}
import herd.convertx.api {
	Context,
	Converter,
	wired
}

wired
shared class FloatToStringConverter() satisfies Converter<Float,String>  {
	shared actual String convert(Context context, Float source, Type<String> resultType) =>  source.string;
	
}