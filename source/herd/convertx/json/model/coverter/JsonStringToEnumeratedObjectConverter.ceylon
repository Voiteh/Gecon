import herd.convertx.core.api.component {
	wired,
	Converter
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	ClassOrInterface,
	Type
}
import ceylon.language.meta {
	type
}

shared wired class JsonStringToEnumeratedObjectConverter() satisfies Converter<String,Object>{
	shared actual Object convert(Context context, String source, Type<Object> resultType) {
		assert(is ClassOrInterface<Object> resultType);
		assert(exists objectValue=resultType.caseValues.find((Object elem) => type(elem).declaration.name==source));
		return objectValue;
	}
	matcher => object satisfies JsonStringToEnumeratedObjectConverter.Matcher{
		shared actual Boolean match(String source, Type<Object> resultType) {
			if(is ClassOrInterface<Object> resultType, !resultType.caseValues.empty,exists objectValue=resultType.caseValues.find((Object elem) => type(elem).declaration.name==source)){
				return true;
			}
			return false;
		}
		
		
		shared actual Integer priority => 1;
		
		
	};
}