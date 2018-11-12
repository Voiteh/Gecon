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

"Converts [[Integer]] value into [[Character]]. The result will be the same as calling [[Integer.character]] "
tagged("Basic")
by("Wojciech Potiopa")
shared wired class IntegerToCharacterConverter() satisfies Converter<Integer,Character>{
	shared actual Character convert(Delegator delegator, Integer source, Type<Character> resultType) => source.character;
	
}