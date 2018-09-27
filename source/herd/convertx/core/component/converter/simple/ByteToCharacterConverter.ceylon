

import ceylon.language.meta.model {
	Type
}
import herd.convertx.api.component {
	Converter
}
import herd.convertx.api.operation {
	Delegator,
	wired
}



wired
shared class ByteToCharacterConverter() satisfies Converter<Byte,Character>  {
	shared actual Character convert(Delegator delegator, Byte source, Type<Character> resultType) {
		value convert = delegator.convert(source, `Integer`);
		return convert.character;
	}
	
}
