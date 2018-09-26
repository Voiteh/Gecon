import herd.convertx.api.component {
	Converter,
	ConvertionException,
	wired
}
import herd.convertx.api {
	Context
}
import ceylon.language.meta.model {
	Type
}
wired
shared class StringToFloatConverter() satisfies Converter<String,Float> {
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