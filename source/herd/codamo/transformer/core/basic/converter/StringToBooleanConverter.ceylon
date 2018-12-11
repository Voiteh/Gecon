
import ceylon.language.meta.model {
	Type
}


import herd.codamo.api.core.transformer {
	Converter,
	provided,
	ConvertionError,
	Delegator
}
"Converts [[String]] value into [[Boolean]].
 
 Corelations source -> result, will be:
 
 \"false\" -> false
 
 \"true\" -> true
 
 Given [[String]] x, x != \"false\" & x != \"true\", then [[ConvertionError]]"

tagged("Basic")
by("Wojciech Potiopa")
shared provided class StringToBooleanConverter() satisfies Converter<String,Boolean>  {
	shared actual Boolean convert(Delegator delegator, String source, Type<Boolean> resultType) {
		value result = Boolean.parse(source);
		switch (result)
		case (is Boolean) {
			return result;
		}
		else {
			throw ConvertionError(source, resultType, result);
		}
	}
	
}