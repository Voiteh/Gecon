import herd.convertx.core.api.component {
	Component,
	Converter,
	ConvertionException
}
import ceylon.language.meta.model {
	Type
}
import herd.convertx.core.api {
	Context
}
service(`interface Component`)
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