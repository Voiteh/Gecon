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
shared class IntegerToFloatConverter() satisfies Converter<Integer,Float>  {
	shared actual Float convert(Delegator delegator, Integer source, Type<Float> resultType) => source.float;
	
}