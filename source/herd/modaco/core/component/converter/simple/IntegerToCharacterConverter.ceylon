import ceylon.language.meta.model {
	Type
}


import herd.modaco.api.component {
	Converter
}
import herd.modaco.api.operation {
	Delegator,
	wired
}

wired
shared class IntegerToCharacterConverter() satisfies Converter<Integer,Character>{
	shared actual Character convert(Delegator delegator, Integer source, Type<Character> resultType) => source.character;
	
}