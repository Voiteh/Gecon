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


shared wired class ByteToStringConverter() satisfies Converter<Byte,String>  {
	shared actual String convert(Delegator delegator, Byte source, Type<String> resultType) =>  source.string;
	
}