import ceylon.language.meta.model {
	Type
}

import herd.convertx.api {
	wired
}
import herd.convertx.api.component {
	Converter
}
import herd.convertx.api.operation {
	Delegator
}

wired
shared class IntegerToCharacterConverter() satisfies Converter<Integer,Character>{
	shared actual Character convert(Delegator delegator, Integer source, Type<Character> resultType) => source.character;
	
}