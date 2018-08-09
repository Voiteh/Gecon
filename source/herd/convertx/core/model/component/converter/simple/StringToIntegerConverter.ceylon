import ceylon.language.meta.model {
	Type
}
import herd.convertx.core.api.component {
	ConvertionException,
	Converter,
	Component
}
import herd.convertx.core.api {
	Context
}
service(`interface Component`)
shared class StringToIntegerConverter() satisfies Converter<String,Integer>  {
	shared actual Integer convert(Context context, String source, Type<Integer> resultType) {
		value parse = Integer.parse(source);
		switch (parse)
		case (is Integer) {
			return parse;
		}
		case (is ParseException) {
			throw ConvertionException(source, resultType, parse);
		}
	}
	
}