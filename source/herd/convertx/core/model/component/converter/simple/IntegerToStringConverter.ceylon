import ceylon.language.meta.model {
	Type
}
import herd.convertx.api {
	Context,
	Converter,
	wired
}

wired
shared class IntegerToStringConverter() satisfies Converter<Integer,String>  {
	shared actual String convert(Context context, Integer source, Type<String> resultType) =>  source.string;
	
}