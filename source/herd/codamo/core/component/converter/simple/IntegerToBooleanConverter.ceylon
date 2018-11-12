import ceylon.language.meta.model {
	Type
}


import herd.codamo.api.operation {
	ConvertionError,
	Delegator,
	wired
}
import herd.codamo.api.component {
	Converter
}

"Converts [[Integer]] value into [[Boolean]].
 
 Possible corelations source -> result:
 
 0 -> false
 
 1 -> true
 
 Given [[Integer]] x, x < 0 | x > 1 -> ConvertionError"
tagged("Basic")
by("Wojciech Potiopa")
shared wired class IntegerToBooleanConverter() satisfies Converter<Integer,Boolean>  {
	shared actual Boolean convert(Delegator delegator, Integer source, Type<Boolean> resultType) {
		switch (source)
		case (0) {
			return false;
		}
		case (1) {
			return true;
		}
		else {
			throw ConvertionError(source, resultType, Exception("Only 0/1 values are convertable to Boolean"));
		}
	}
	
}