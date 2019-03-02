import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.core.transformer {
	Converter,
	
	Delegator
}
"Converts [[Integer]] value to [[Byte]], exactly as calling [[Integer.byte]]"
tagged("Basic")
by("Wojciech Potiopa")
shared class IntegerToByteConverter() extends Converter<Integer,Byte,Type<Byte>>(){
	shared actual Byte convert(Delegator delegator, Integer source, Type<Byte> resultType) => source.byte;
	
}