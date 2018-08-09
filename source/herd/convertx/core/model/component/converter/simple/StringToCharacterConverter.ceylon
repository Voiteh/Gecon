import ceylon.language.meta.model {
	Type
}
import herd.convertx.core.api.component {
	ConvertionException,
	Converter,
	Component
}
import herd.convertx.core.api {
	Context
}
service(`interface Component`)
shared class StringToCharacterConverter() satisfies Converter<String,Character> {
	shared actual Character convert(Context context, String source, Type<Character> resultType) {
		if (exists char = source.first) {
			return char;
		}
		throw ConvertionException(source, resultType, Exception("Can't convert empty string to Character"));
	}
	
}