import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.core.transformer {
	Converter,
	provided,
	Delegator
}
"Converts [[Character]] value into [[String]].Result will be exactly as calling [[Character.string]]" 
tagged("Basic")
by("Wojciech Potiopa")
shared provided class CharacterToStringConverter() satisfies Converter<Character,String>  {
	shared actual String convert(Delegator delegator, Character source, Type<String> resultType) =>  source.string;
	
}