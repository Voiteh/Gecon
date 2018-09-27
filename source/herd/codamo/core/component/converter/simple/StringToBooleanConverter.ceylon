
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
wired
shared class StringToBooleanConverter() satisfies Converter<String,Boolean>  {
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