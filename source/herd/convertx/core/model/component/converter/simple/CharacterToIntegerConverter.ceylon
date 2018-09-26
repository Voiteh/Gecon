import ceylon.language.meta.model {
	Type
}
import herd.convertx.api {
	Context
}
import herd.convertx.api.component {
	Converter,
	wired
}
wired
shared class CharacterToIntegerConverter() satisfies Converter<Character,Integer>  {
	shared actual Integer convert(Context context, Character source, Type<Integer> resultType) => source.integer;
	
}