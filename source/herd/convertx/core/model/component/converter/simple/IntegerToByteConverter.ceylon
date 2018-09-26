import ceylon.language.meta.model {
	Type
}
import herd.convertx.api {
	Context,
	Converter,
	wired
}

wired
shared class IntegerToByteConverter() satisfies Converter<Integer,Byte>{
	shared actual Byte convert(Context context, Integer source, Type<Byte> resultType) => source.byte;
	
}