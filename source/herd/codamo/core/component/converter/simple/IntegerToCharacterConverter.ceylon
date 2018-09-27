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
shared class IntegerToCharacterConverter() satisfies Converter<Integer,Character>{
	shared actual Character convert(Delegator delegator, Integer source, Type<Character> resultType) => source.character;
	
}