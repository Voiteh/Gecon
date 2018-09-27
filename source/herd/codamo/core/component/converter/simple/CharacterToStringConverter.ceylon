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
shared class CharacterToStringConverter() satisfies Converter<Character,String>  {
	shared actual String convert(Delegator delegator, Character source, Type<String> resultType) =>  source.string;
	
}