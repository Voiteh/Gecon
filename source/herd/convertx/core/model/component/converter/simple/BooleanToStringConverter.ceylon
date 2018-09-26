
import herd.convertx.api {
	Context,
	Converter,
	wired
}
import ceylon.language.meta.model {
	Type
}
wired
shared class BooleanToStringConverter() satisfies Converter<Boolean,String>  {
	shared actual String convert(Context context, Boolean source, Type<String> resultType) =>  source.string;
	
}
