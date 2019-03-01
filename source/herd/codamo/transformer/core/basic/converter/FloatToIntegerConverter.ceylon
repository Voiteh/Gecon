import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.core.transformer {
	Converter,
	
	Delegator
}

"Converts [[Float]] value into [[Integer]]. Exactly as calling [[Float.integer]]"
tagged("Basic")
by("Wojciech Potiopa")
shared class FloatToIntegerConverter() extends Converter<Float,Integer>()  {
	shared actual Integer convert(Delegator delegator, Float source, Type<Integer> resultType) => source.integer;
	
}