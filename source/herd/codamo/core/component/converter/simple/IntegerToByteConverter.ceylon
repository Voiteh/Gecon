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
"Converts [[Integer]] value to [[Byte]], exactly as calling [[Integer.byte]]"
tagged("Basic")
by("Wojciech Potiopa")
shared wired class IntegerToByteConverter() satisfies Converter<Integer,Byte>{
	shared actual Byte convert(Delegator delegator, Integer source, Type<Byte> resultType) => source.byte;
	
}