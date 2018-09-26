import herd.convertx.api {
	Context,
	Converter,
	ConvertionException,
	wired
}
import ceylon.language.meta.model {
	Type
}

shared wired class StringToFloatConverter() satisfies Converter<String,Float> {
	shared actual Float convert(Context context, String source, Type<Float> resultType) {
		value parse = Float.parse(source);
		switch(parse)
		case (is Float) {
			return parse;
		}else{
			throw ConvertionException(source, resultType,parse);
		}
	}
	
}