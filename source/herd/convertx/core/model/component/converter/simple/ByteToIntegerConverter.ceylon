
import herd.convertx.api {
	Context,
	Converter,
	wired
}
import ceylon.language.meta.model {
	Type
}
wired
shared class ByteToIntegerConverter() satisfies Converter<Byte,Integer>  {
	shared actual Integer convert(Context context, Byte source, Type<Integer> resultType) => source.signed;
	
}

