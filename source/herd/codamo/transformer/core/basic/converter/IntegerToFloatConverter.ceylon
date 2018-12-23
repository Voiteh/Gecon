import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.core.transformer {
	Converter,
	provided,
	Delegator
}


"Converts [[Integer]] value to [[Float]]. Exactly as calling [[Integer.float]]"
tagged("Basic")
by("Wojciech Potiopa")
shared provided class IntegerToFloatConverter() satisfies Converter<Integer,Float>  {
	shared actual Float convert(Delegator delegator, Integer source, Type<Float> resultType) => source.float;
	
}