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

"Converts [[Integer]] value into [[String]]. Exactly as calling [[Integer.string]]"
tagged("Basic")
by("Wojciech Potiopa")
shared wired class IntegerToStringConverter() satisfies Converter<Integer,String>  {
	shared actual String convert(Delegator delegator, Integer source, Type<String> resultType) =>  source.string;
	
}