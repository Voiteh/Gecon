import ceylon.language.meta.model {
	Type
}

import herd.modaco.api.component {
	Converter
}
import herd.modaco.api.operation {
	Delegator,
	wired
}

wired
shared class FloatToIntegerConverter() satisfies Converter<Float,Integer>  {
	shared actual Integer convert(Delegator delegator, Float source, Type<Integer> resultType) => source.integer;
	
}