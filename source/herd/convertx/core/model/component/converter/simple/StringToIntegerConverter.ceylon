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