import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.component {
	Converter
}
import herd.codamo.api.operation {
	Delegator,
	provided
}

"Converts [[Float]] value into [[Integer]]. Exactly as calling [[Float.integer]]"
tagged("Basic")
by("Wojciech Potiopa")
shared provided class FloatToIntegerConverter() satisfies Converter<Float,Integer>  {
	shared actual Integer convert(Delegator delegator, Float source, Type<Integer> resultType) => source.integer;
	
}