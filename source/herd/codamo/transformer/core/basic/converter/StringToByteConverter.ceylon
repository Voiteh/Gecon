

import ceylon.language.meta.model {
	Type
}
import herd.codamo.api.core.transformer {
	Converter,
	
	Delegator
}

"Converts [[String]] value into [[Byte]]
 
 Given [[String]] x, [[Integer]] y, y >= -128, y <= 127, x = y.string then Integer.parse(x).byte.
 
 Else given [[String]] x then ConvertionError
 "
tagged("Basic")
by("Wojciech Potiopa")
shared class StringToByteConverter() extends Converter<String,Byte>(){
	shared actual Byte convert(Delegator delegator, String source, Type<Byte> resultType){
		value convert=delegator.convert(source,`Integer`);
		return convert.byte;
	}
	
	
}







