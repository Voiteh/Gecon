

import ceylon.language.meta.model {
	Type
}

import herd.gecon.api.transformer {
	Converter,
	Delegator
}

"Converts [[Boolean]] type value into [[String]]. 
 
 Possible corelations source -> result:
 
 true -> \"true\"
 
 false -> \"false\"
 "
tagged("Basic")
by("Wojciech Potiopa")
shared class BooleanToStringConverter() extends Converter<Boolean,String,Type<String>>()  {
	shared actual String convert(Delegator delegator, Boolean source, Type<String> resultType) =>  source.string;
	
}
