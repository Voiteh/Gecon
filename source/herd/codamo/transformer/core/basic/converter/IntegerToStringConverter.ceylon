import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.core.transformer {
	Converter,
	provided,
	Delegator
}

"Converts [[Integer]] value into [[String]]. Exactly as calling [[Integer.string]]"
tagged("Basic")
by("Wojciech Potiopa")
shared provided class IntegerToStringConverter() satisfies Converter<Integer,String>  {
	shared actual String convert(Delegator delegator, Integer source, Type<String> resultType) =>  source.string;
	
}