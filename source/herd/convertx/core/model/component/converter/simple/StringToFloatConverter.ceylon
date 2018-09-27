import herd.convertx.api {
	wired
}
import ceylon.language.meta.model {
	Type
}
import herd.convertx.api.operation {
	ConvertionError,
	Delegator
}
import herd.convertx.api.component {
	Converter
}

shared wired class StringToFloatConverter() satisfies Converter<String,Float> {
	shared actual Float convert(Delegator delegator, String source, Type<Float> resultType) {
		value parse = Float.parse(source);
		switch(parse)
		case (is Float) {
			return parse;
		}else{
			throw ConvertionError(source, resultType,parse);
		}
	}
	
}