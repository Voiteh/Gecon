import ceylon.language.meta.model {
	Type
}


import herd.codamo.api.core.transformer {
	Converter,
	provided,
	Delegator
}

"Converts [[Integer]] value into [[Character]]. The result will be the same as calling [[Integer.character]] "
tagged("Basic")
by("Wojciech Potiopa")
shared provided class IntegerToCharacterConverter() satisfies Converter<Integer,Character>{
	shared actual Character convert(Delegator delegator, Integer source, Type<Character> resultType) => source.character;
	
}