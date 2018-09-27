

import ceylon.language.meta.model {
	Type
}
import herd.codamo.api.component {
	Converter
}
import herd.codamo.api.operation {
	Delegator,
	wired
}
wired
shared class ByteToIntegerConverter() satisfies Converter<Byte,Integer>  {
	shared actual Integer convert(Delegator delegator, Byte source, Type<Integer> resultType) => source.signed;
	
}

