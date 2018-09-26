import ceylon.language.meta.model {
	Type
}
import herd.convertx.api {
	Context,
	Converter,
	wired
}

wired
shared class FloatToIntegerConverter() satisfies Converter<Float,Integer>  {
	shared actual Integer convert(Context context, Float source, Type<Integer> resultType) => source.integer;
	
}