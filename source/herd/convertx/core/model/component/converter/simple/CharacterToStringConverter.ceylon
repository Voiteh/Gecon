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

wired
shared class CharacterToStringConverter() satisfies Converter<Character,String>  {
	shared actual String convert(Delegator delegator, Character source, Type<String> resultType) =>  source.string;
	
}