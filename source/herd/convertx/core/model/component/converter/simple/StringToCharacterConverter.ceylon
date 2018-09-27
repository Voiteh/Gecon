import ceylon.language.meta.model {
	Type
}

import herd.convertx.api {
	wired
}
import herd.convertx.api.operation {
	ConvertionError,
	Delegator
}
import herd.convertx.api.component {
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