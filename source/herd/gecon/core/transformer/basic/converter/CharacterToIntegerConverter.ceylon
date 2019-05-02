import ceylon.language.meta.model {
	Type
}

import herd.gecon.core.api.transformer {
	Converter,
	
	Delegator
}
"Converts [[Character]] value into [[Integer]], Result will be exactly as when calling [[Character.integer]]"
tagged("Basic")
by("Wojciech Potiopa")
shared class CharacterToIntegerConverter() extends Converter<Character,Integer,Type<Integer>>()  {
	shared actual Integer convert(Delegator delegator, Character source, Type<Integer> resultType) => source.integer;
	
}