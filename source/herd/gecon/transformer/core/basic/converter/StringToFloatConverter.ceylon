
import ceylon.language.meta.model {
	Type
}

import herd.gecon.api.transformer {
	Converter,
	Delegator
}

"Converts [[String]] value into [[Float]]. 
 
 Given [[String]] x, [[Float y]], x=y.string then Float.parse(x) 

 Else given [[String]] x then [[Error]]
 "
tagged("Basic")
by("Wojciech Potiopa")
shared class StringToFloatConverter() extends Converter<String,Float,Type<Float>>() {
	shared actual Float convert(Delegator delegator, String source, Type<Float> resultType) {
		value parse = Float.parse(source);
		switch(parse)
		case (is Float) {
			return parse;
		}else{
			throw Error(source, resultType,parse);
		}
	}
	
}