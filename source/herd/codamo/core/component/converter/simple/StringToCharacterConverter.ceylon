import ceylon.language.meta.model {
	Type
}


import herd.codamo.api.operation {
	ConvertionError,
	Delegator,
	wired
}
import herd.codamo.api.component {
	Converter
}

"Converts [[String]] value into [[Character]]
 
 Given [[String]] x = \"\" then [[ConvertionError]]
 
 Else given [[String]] x then x.first"
tagged("Basic")
by("Wojciech Potiopa")
shared wired class StringToCharacterConverter() satisfies Converter<String,Character> {
	shared actual Character convert(Delegator delegator, String source, Type<Character> resultType) {
		if (exists char = source.first) {
			return char;
		}
		throw ConvertionError(source, resultType, Exception("Can't convert empty string to Character"));
	}
	
}