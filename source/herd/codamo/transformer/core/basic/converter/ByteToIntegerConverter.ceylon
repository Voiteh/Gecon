

import ceylon.language.meta.model {
	Type
}
import herd.codamo.api.core.transformer {
	Converter,
	
	Delegator
}


"Converts [[Byte]] value into [[Integer]]. The result will be signed value exactly as calling [[Byte.signed]]
 
 For example:
 
   -125.byte -> -125
   
   93.byte -> 93
   
    "
tagged("Basic")
by("Wojciech Potiopa")
shared class ByteToIntegerConverter() extends Converter<Byte,Integer>()  {
	shared actual Integer convert(Delegator delegator, Byte source, Type<Integer> resultType) => source.signed;
	
}

