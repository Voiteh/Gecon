import ceylon.language.meta.model {
	Type
}
import herd.convertx.api {
	Context,
	Converter,
	wired
}

wired
shared class IntegerToFloatConverter() satisfies Converter<Integer,Float>  {
	shared actual Float convert(Context context, Integer source, Type<Float> resultType) => source.float;
	
}