import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.core.transformer {
	Converter,
	provided,
	Delegator
}
"Converts [[Character]] value into [[Integer]], Result will be exactly as when calling [[Character.integer]]"
tagged("Basic")
by("Wojciech Potiopa")
shared provided class CharacterToIntegerConverter() satisfies Converter<Character,Integer>  {
	shared actual Integer convert(Delegator delegator, Character source, Type<Integer> resultType) => source.integer;
	
}