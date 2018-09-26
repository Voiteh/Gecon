
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
shared class StringToBooleanConverter() satisfies Converter<String,Boolean>  {
	shared actual Boolean convert(Context context, String source, Type<Boolean> resultType) {
		value result = Boolean.parse(source);
		switch (result)
		case (is Boolean) {
			return result;
		}
		else {
			throw ConvertionException(source, resultType, result);
		}
	}
	
}