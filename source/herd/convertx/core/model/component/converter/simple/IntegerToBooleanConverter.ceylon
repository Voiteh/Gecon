import ceylon.language.meta.model {
	Type
}

import herd.convertx.api {
	Context,
	Converter,
	ConvertionException,
	wired
}
wired
shared class IntegerToBooleanConverter() satisfies Converter<Integer,Boolean>  {
	shared actual Boolean convert(Context context, Integer source, Type<Boolean> resultType) {
		switch (source)
		case (0) {
			return false;
		}
		case (1) {
			return true;
		}
		else {
			throw ConvertionException(source, resultType, Exception("Only 0/1 values are convertable to Boolean"));
		}
	}
	
}