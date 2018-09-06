import herd.convertx.core.api.component {
	wired,
	TypedConverter,
	ConvertionException
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	ClassOrInterface
}
import ceylon.language.meta {
	type
}
wired
shared class StringToEnumeratedObjectConverter() satisfies TypedConverter<String,ClassOrInterface<Object>,Object>{
	shared actual Object convert(Context context, String source, ClassOrInterface<Object> resultType) {
		if(exists objectValue=resultType.caseValues.find((Object elem) => type(elem).declaration.name==source)){
			return objectValue;
		}
		throw ConvertionException(source, resultType,Exception("Can't find enumerated object named ``source`` of type: ``resultType``"));
	}
	matcher => object satisfies StringToEnumeratedObjectConverter.Matcher{
		shared actual Boolean match(String source, ClassOrInterface<Object> resultType) => !resultType.caseValues.empty;
		
		
		shared actual Integer priority => 1;
		
		
	};
}