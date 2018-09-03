import ceylon.language.meta.model {
	Type
}
import herd.convertx.core.api.component {
	Converter,
	wired
}
import herd.convertx.core.api {
	Context
}

wired
shared class IntegerToCharacterConverter() satisfies Converter<Integer,Character>{
	shared actual Character convert(Context context, Integer source, Type<Character> resultType) => source.character;
	
}