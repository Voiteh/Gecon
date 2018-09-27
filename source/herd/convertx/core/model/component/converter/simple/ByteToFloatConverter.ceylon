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

shared wired class ByteToFloatConverter() satisfies Converter<Byte,Float>  {
	shared actual Float convert(Delegator delegator, Byte source, Type<Float> resultType){
		value convert = delegator.convert(source, `Integer`);
		return convert.float;
	}
	
}