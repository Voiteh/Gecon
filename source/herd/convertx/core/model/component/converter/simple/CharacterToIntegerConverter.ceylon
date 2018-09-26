import ceylon.language.meta.model {
	Type
}
import herd.convertx.api {
	Context,
	Converter,
	wired
}

shared wired class CharacterToIntegerConverter() satisfies Converter<Character,Integer>  {
	shared actual Integer convert(Context context, Character source, Type<Integer> resultType) => source.integer;
	
}