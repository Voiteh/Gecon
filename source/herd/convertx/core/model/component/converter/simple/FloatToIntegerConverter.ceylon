import ceylon.language.meta.model {
	Type
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.component {
	Converter,
	Component
}
service(`interface Component`)
shared class FloatToIntegerConverter() satisfies Converter<Float,Integer>  {
	shared actual Integer convert(Context context, Float source, Type<Integer> resultType) => source.integer;
	
}