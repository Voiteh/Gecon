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

"Converts [[Integer]] value into [[String]]. Exactly as calling [[Integer.string]]"
tagged("Basic")
by("Wojciech Potiopa")
shared provided class IntegerToStringConverter() satisfies Converter<Integer,String>  {
	shared actual String convert(Delegator delegator, Integer source, Type<String> resultType) =>  source.string;
	
}