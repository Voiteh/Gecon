import herd.convertx.core.api.component {
	Converter,
	wired
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	Type
}
wired
shared class ByteToIntegerConverter() satisfies Converter<Byte,Integer>  {
	shared actual Integer convert(Context context, Byte source, Type<Integer> resultType) => source.signed;
	
}

