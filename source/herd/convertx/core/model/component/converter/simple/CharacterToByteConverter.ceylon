import ceylon.language.meta.model {
	Type
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.component {
	Converter,
	wired
}
wired
shared class CharacterToByteConverter() satisfies Converter<Character,Byte>{
	shared actual Byte convert(Context context, Character source, Type<Byte> resultType) => source.integer.byte;
	
}