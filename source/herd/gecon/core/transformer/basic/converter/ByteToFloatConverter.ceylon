import ceylon.language.meta.model {
	Type
}

import herd.gecon.core.api.transformer {
	Converter,
	
	Delegator
}
"Converts [[Byte]] value into [[Float]]
 
  Possible corelations source -> result:
  
  Given [[Byte]] x, x.byte -> x.float (x.0) 
 "
tagged("Basic")
by("Wojciech Potiopa")
shared class ByteToFloatConverter() extends Converter<Byte,Float,Type<Float>>()  {
	shared actual Float convert(Delegator delegator, Byte source, Type<Float> resultType){
		value convert = delegator.convert(source, `Integer`);
		return convert.float;
	}
	
}