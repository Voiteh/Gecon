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

shared wired class ByteToFloatConverter() satisfies Converter<Byte,Float>  {
	shared actual Float convert(Delegator delegator, Byte source, Type<Float> resultType){
		value convert = delegator.convert(source, `Integer`);
		return convert.float;
	}
	
}