

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


"Converts [[Byte]] value into [[Character]]
 
 The result value will be one of ASCII character symbols"
tagged("Basic")
by("Wojciech Potiopa")
shared wired class ByteToCharacterConverter() satisfies Converter<Byte,Character>  {
	shared actual Character convert(Delegator delegator, Byte source, Type<Character> resultType) {
		value convert = delegator.convert(source, `Integer`);
		return convert.character;
	}
	
}
