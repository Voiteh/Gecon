import ceylon.language.meta.model {
	Type
}
import herd.convertx.api {
	wired
}
import herd.convertx.api.component {
	Converter
}
import herd.convertx.api.operation {
	Delegator
}

shared wired class CharacterToIntegerConverter() satisfies Converter<Character,Integer>  {
	shared actual Integer convert(Delegator delegator, Character source, Type<Integer> resultType) => source.integer;
	
}