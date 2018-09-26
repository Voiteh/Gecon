
import herd.convertx.api {
	Context,
	Converter,
	wired
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
