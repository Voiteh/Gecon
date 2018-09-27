import ceylon.language.meta.model {
	Type
}


import herd.modaco.api.operation {
	ConvertionError,
	Delegator,
	wired
}
import herd.modaco.api.component {
	Converter
}
wired
shared class StringToCharacterConverter() satisfies Converter<String,Character> {
	shared actual Character convert(Delegator delegator, String source, Type<Character> resultType) {
		if (exists char = source.first) {
			return char;
		}
		throw ConvertionError(source, resultType, Exception("Can't convert empty string to Character"));
	}
	
}