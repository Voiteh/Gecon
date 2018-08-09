import herd.convertx.core.api.component {
	Converter,
	ConvertionException,
	Component
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	Type
}
service(`interface Component`)
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