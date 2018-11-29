

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


"Converts [[Boolean]] type value into [[String]]. 
 
 Possible corelations source -> result:
 
 true -> \"true\"
 
 false -> \"false\"
 "
tagged("Basic")
by("Wojciech Potiopa")
shared wired class BooleanToStringConverter() satisfies Converter<Boolean,String>  {
	shared actual String convert(Delegator delegator, Boolean source, Type<String> resultType) =>  source.string;
	
}
