import ceylon.language.meta.model {
	Type
}
import herd.convertx.api {
	Context,
	Converter,
	wired
}


shared wired class ByteToStringConverter() satisfies Converter<Byte,String>  {
	shared actual String convert(Context context, Byte source, Type<String> resultType) =>  source.string;
	
}