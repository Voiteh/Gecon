

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
shared class BooleanToStringConverter() satisfies Converter<Boolean,String>  {
	shared actual String convert(Delegator delegator, Boolean source, Type<String> resultType) =>  source.string;
	
}
