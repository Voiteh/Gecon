import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.core.transformer {
	Converter,
	
	Delegator
}

"Converts [[Integer]] value into [[String]]. Exactly as calling [[Integer.string]]"
tagged("Basic")
by("Wojciech Potiopa")
shared class IntegerToStringConverter() extends Converter<Integer,String>()  {
	shared actual String convert(Delegator delegator, Integer source, Type<String> resultType) =>  source.string;
	
}