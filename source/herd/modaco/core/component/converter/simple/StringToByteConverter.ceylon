

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
shared class StringToByteConverter() satisfies Converter<String,Byte> {
	shared actual Byte convert(Delegator delegator, String source, Type<Byte> resultType){
		value convert=delegator.convert(source,`Integer`);
		return convert.byte;
	}
	
	
}







