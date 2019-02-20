import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.core.transformer {
	Converter,
	provided,
	Delegator
}

"Converts [[Character]] value into [[Byte]]. Result will be exactly as calling Character.integer.byte"
tagged("Basic")
by("Wojciech Potiopa")
shared provided class CharacterToByteConverter() satisfies Converter<Character,Byte>{
	shared actual Byte convert(Delegator delegator, Character source, Type<Byte> resultType) => source.integer.byte;
	
}