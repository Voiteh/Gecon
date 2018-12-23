

import ceylon.language.meta.model {
	Type
}
import herd.codamo.api.core.transformer {
	Converter,
	provided,
	Delegator
}


"Converts [[Byte]] value into [[Character]]
 
 The result value will be one of ASCII character symbols"
tagged("Basic")
by("Wojciech Potiopa")
shared provided class ByteToCharacterConverter() satisfies Converter<Byte,Character>  {
	shared actual Character convert(Delegator delegator, Byte source, Type<Character> resultType) {
		value convert = delegator.convert(source, `Integer`);
		return convert.character;
	}
	
}
