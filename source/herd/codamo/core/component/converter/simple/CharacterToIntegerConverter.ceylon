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

"Converts [[Character]] value into [[Integer]], Result will be exactly as when calling [[Character.integer]]"
tagged("Basic")
by("Wojciech Potiopa")
shared wired class CharacterToIntegerConverter() satisfies Converter<Character,Integer>  {
	shared actual Integer convert(Delegator delegator, Character source, Type<Integer> resultType) => source.integer;
	
}