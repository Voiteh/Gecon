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
shared class FloatToStringConverter() satisfies Converter<Float,String>  {
	shared actual String convert(Delegator delegator, Float source, Type<String> resultType) =>  source.string;
	
}