import herd.convertx.core.api.component {
	Converter,
	wired
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	Type
}



wired
shared class ByteToCharacterConverter() satisfies Converter<Byte,Character>  {
	shared actual Character convert(Context context, Byte source, Type<Character> resultType) {
		value convert = context.convert(source, `Integer`);
		return convert.character;
	}
	
}
