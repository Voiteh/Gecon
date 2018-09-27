
import herd.convertx.api {
	wired
}
import ceylon.language.meta.model {
	Type
}
import herd.convertx.api.component {
	Converter
}
import herd.convertx.api.operation {
	Delegator
}
wired
shared class ByteToIntegerConverter() satisfies Converter<Byte,Integer>  {
	shared actual Integer convert(Delegator delegator, Byte source, Type<Integer> resultType) => source.signed;
	
}

