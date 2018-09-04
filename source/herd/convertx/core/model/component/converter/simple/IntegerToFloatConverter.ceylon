import ceylon.language.meta.model {
	Type
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.component {
	Converter,
	wired
}
wired
shared class IntegerToFloatConverter() satisfies Converter<Integer,Float>  {
	shared actual Float convert(Context context, Integer source, Type<Float> resultType) => source.float;
	
}