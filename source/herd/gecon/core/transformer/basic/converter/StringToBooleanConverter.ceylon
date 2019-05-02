
import ceylon.language.meta.model {
	Type
}

import herd.gecon.core.api.transformer {
	Converter,
	Delegator
}
"Converts [[String]] value into [[Boolean]].
 
 Corelations source -> result, will be:
 
 \"false\" -> false
 
 \"true\" -> true
 
 Given [[String]] x, x != \"false\" & x != \"true\", then [[Convertion<>.Error]]"

tagged("Basic")
by("Wojciech Potiopa")
shared class StringToBooleanConverter() extends Converter<String,Boolean,Type<Boolean>>()  {
	shared actual Boolean convert(Delegator delegator, String source, Type<Boolean> resultType) {
		value result = Boolean.parse(source);
		switch (result)
		case (is Boolean) {
			return result;
		}
		else {
			throw Error(source, resultType, result);
		}
	}
	
}