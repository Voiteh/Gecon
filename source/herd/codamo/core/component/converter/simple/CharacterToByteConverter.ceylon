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

wired
shared class CharacterToByteConverter() satisfies Converter<Character,Byte>{
	shared actual Byte convert(Delegator delegator, Character source, Type<Byte> resultType) => source.integer.byte;
	
}