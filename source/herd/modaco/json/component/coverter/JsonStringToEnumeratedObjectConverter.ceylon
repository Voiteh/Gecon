
import ceylon.language.meta.model {
	ClassOrInterface,
	Type
}
import ceylon.language.meta {
	type
}
import herd.modaco.api.operation {
	Convertion,
	Delegator,
	wired
}
import herd.modaco.api.component {
	Converter
}

shared wired class JsonStringToEnumeratedObjectConverter() satisfies Converter<String,Object>{
	shared actual Object convert(Delegator delegator, String source, Type<Object> resultType) {
		assert(is ClassOrInterface<Object> resultType);
		assert(exists objectValue=resultType.caseValues.find((Object elem) => type(elem).declaration.name==source));
		return objectValue;
	}
	shared actual Convertion<String,Object,Type<Object>>.Matcher? matcher => object satisfies Convertion<String,Object,Type<Object>>.Matcher{
		shared actual Boolean match(String source, Type<Object> resultType) {
			if(is ClassOrInterface<Object> resultType, !resultType.caseValues.empty,exists objectValue=resultType.caseValues.find((Object elem) => type(elem).declaration.name==source)){
				return true;
			}
			return false; 
		}
		
		shared actual Integer priority => 1;
	};
}
