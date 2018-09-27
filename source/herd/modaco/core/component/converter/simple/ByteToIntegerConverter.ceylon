

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
wired
shared class ByteToIntegerConverter() satisfies Converter<Byte,Integer>  {
	shared actual Integer convert(Delegator delegator, Byte source, Type<Integer> resultType) => source.signed;
	
}

