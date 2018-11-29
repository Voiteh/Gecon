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

"Converts [[Byte]] into [[String]]. Result value will be exactly as calling [[Byte.string]]" 
tagged("Basic")
by("Wojciech Potiopa")
shared provided class ByteToStringConverter() satisfies Converter<Byte,String>  {
	shared actual String convert(Delegator delegator, Byte source, Type<String> resultType) =>  source.string;
	
}