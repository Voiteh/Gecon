import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.component {
	Converter
}
import herd.codamo.api.operation {
	Delegator,
	provided
}

"Converts [[Byte]] value into [[Float]]
 
  Possible corelations source -> result:
  
  Given [[Byte]] x, x.byte -> x.float (x.0) 
 "
tagged("Basic")
by("Wojciech Potiopa")
shared provided class ByteToFloatConverter() satisfies Converter<Byte,Float>  {
	shared actual Float convert(Delegator delegator, Byte source, Type<Float> resultType){
		value convert = delegator.convert(source, `Integer`);
		return convert.float;
	}
	
}