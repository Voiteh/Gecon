import ceylon.language.meta.model {
	Type
}
import herd.convertx.api {
	Context
}
import herd.convertx.api.component {
	Converter,
	wired
}
wired
shared class FloatToIntegerConverter() satisfies Converter<Float,Integer>  {
	shared actual Integer convert(Context context, Float source, Type<Integer> resultType) => source.integer;
	
}