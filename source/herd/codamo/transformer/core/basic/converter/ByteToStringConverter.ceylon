import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.core.transformer {
	Converter,
	
	Delegator
}
"Converts [[Byte]] into [[String]]. Result value will be exactly as calling [[Byte.string]]" 
tagged("Basic")
by("Wojciech Potiopa")
shared class ByteToStringConverter() extends Converter<Byte,String>()  {
	shared actual String convert(Delegator delegator, Byte source, Type<String> resultType) =>  source.string;
	
}