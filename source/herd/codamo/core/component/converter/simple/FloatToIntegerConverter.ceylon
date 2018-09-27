import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.component {
	Converter
}
import herd.codamo.api.operation {
	Delegator,
	wired
}

wired
shared class FloatToIntegerConverter() satisfies Converter<Float,Integer>  {
	shared actual Integer convert(Delegator delegator, Float source, Type<Integer> resultType) => source.integer;
	
}