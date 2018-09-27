import ceylon.language.meta.model {
	Type
}

import herd.convertx.api.component {
	Converter
}
import herd.convertx.api.operation {
	Delegator,
	wired
}

wired
shared class IntegerToStringConverter() satisfies Converter<Integer,String>  {
	shared actual String convert(Delegator delegator, Integer source, Type<String> resultType) =>  source.string;
	
}