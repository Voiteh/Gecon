

import ceylon.language.meta.model {
	Type
}
import herd.codamo.api.core.transformer {
	Converter,
	provided,
	Delegator
}

"Converts [[Boolean]] type value into [[String]]. 
 
 Possible corelations source -> result:
 
 true -> \"true\"
 
 false -> \"false\"
 "
tagged("Basic")
by("Wojciech Potiopa")
shared provided class BooleanToStringConverter() satisfies Converter<Boolean,String>  {
	shared actual String convert(Delegator delegator, Boolean source, Type<String> resultType) =>  source.string;
	
}
