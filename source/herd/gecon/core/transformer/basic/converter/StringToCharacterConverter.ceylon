import ceylon.language.meta.model {
	Type
}

import herd.gecon.core.api.transformer {
	Converter,
	Delegator
}

"Converts [[String]] value into [[Character]]
 
 Given [[String]] x = \"\" then [[Error]]
 
 Else given [[String]] x then x.first"
tagged("Basic")
by("Wojciech Potiopa")
shared class StringToCharacterConverter() extends Converter<String,Character,Type<Character>>() {
	shared actual Character convert(Delegator delegator, String source, Type<Character> resultType) {
		if (exists char = source.first) {
			return char;
		}
		throw Error(source, resultType, Exception("Can't convert empty string to Character"));
	}
	
}