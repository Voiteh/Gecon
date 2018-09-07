import herd.convertx.core.api.component {
	wired,
	TypedConverter
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
shared class JSONStringToEnumeratedObjectConverter() satisfies TypedConverter<String,ClassOrInterface<Object>,Object>{
	shared actual Object convert(Context context, String source, ClassOrInterface<Object> resultType) {
		assert(exists objectValue=resultType.caseValues.find((Object elem) => type(elem).declaration.name==source));
		return objectValue;
	}
	matcher => object satisfies JSONStringToEnumeratedObjectConverter.Matcher{
		shared actual Boolean match(String source, ClassOrInterface<Object> resultType) {
			if( !resultType.caseValues.empty,exists objectValue=resultType.caseValues.find((Object elem) => type(elem).declaration.name==source)){
				return true;
			}
			return false;
		}
		
		
		shared actual Integer priority => 1;
		
		
	};
}