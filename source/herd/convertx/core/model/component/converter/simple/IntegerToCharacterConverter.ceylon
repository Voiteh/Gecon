import ceylon.language.meta.model {
	Type
}
import herd.convertx.core.api.component {
	Converter,
	Component
}
import herd.convertx.core.api {
	Context
}

service(`interface Component`)
shared class IntegerToCharacterConverter() satisfies Converter<Integer,Character>{
	shared actual Character convert(Context context, Integer source, Type<Character> resultType) => source.character;
	
}