

import ceylon.language.meta.model {
	Type
}
import herd.gecon.api.transformer {
	Converter,
	
	Delegator
}


"Converts [[Byte]] value into [[Character]]
 
 The result value will be one of ASCII character symbols"
tagged("Basic")
by("Wojciech Potiopa")
shared class ByteToCharacterConverter() extends Converter<Byte,Character,Type<Character>>()  {
	shared actual Character convert(Delegator delegator, Byte source, Type<Character> resultType) {
		value convert = delegator.convert(source, `Integer`);
		return convert.character;
	}
	
}
