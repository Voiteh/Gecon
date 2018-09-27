import ceylon.language.meta.model {
	Type
}

import herd.modaco.api.component {
	Converter
}
import herd.modaco.api.operation {
	Delegator,
	wired
}


shared wired class ByteToStringConverter() satisfies Converter<Byte,String>  {
	shared actual String convert(Delegator delegator, Byte source, Type<String> resultType) =>  source.string;
	
}