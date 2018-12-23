import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.core.transformer {
	Converter,
	provided,
	Delegator
}

"Converts [[Float]] value into [[String]]. Exactly as calling [[Float.string]]"
tagged("Basic")
by("Wojciech Potiopa")
shared provided class FloatToStringConverter() satisfies Converter<Float,String>  {
	shared actual String convert(Delegator delegator, Float source, Type<String> resultType) =>  source.string;
	
}