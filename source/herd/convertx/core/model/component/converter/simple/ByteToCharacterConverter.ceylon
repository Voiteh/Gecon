import herd.convertx.core.api.component {
	Converter,
	Component
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	Type
}



service(`interface Component`)
shared class ByteToCharacterConverter() satisfies Converter<Byte,Character>  {
	shared actual Character convert(Context context, Byte source, Type<Character> resultType) {
		value convert = context.convert(source, `Integer`);
		return convert.character;
	}
	
}
