import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.core.transformer {
	Converter,
	
	ConvertionError,
	Delegator
}


"Converts [[String]] value into [[Integer]]
 
 Given [[String]] x, [[Integer]] y, x=y.string then Integer.parse(x).
 Else given [[String]] x then [[ConvertionError]]
 "
tagged("Basic")
by("Wojciech Potiopa")
shared class StringToIntegerConverter() extends Converter<String,Integer,Type<Integer>>() {
	shared actual Integer convert(Delegator delegator, String source, Type<Integer> resultType) {
		value parse = Integer.parse(source);
		switch (parse)
		case (is Integer) {
			return parse;
		}
		case (is ParseException) {
			throw ConvertionError(source, resultType, parse);
		}
	}
	
}