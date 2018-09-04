import ceylon.language.meta.model {
	ClassOrInterface
}
import ceylon.language.meta {
	type
}
import herd.convertx.core.api.component {
	ConvertionException,
	TypedConverter,
	wired
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.core.util {
	typeHierarchy
}
wired
shared class EnumToEnumConverter() satisfies  TypedConverter<Object,ClassOrInterface<Object>,Object>{
	shared actual Object convert(Context context, Object source, ClassOrInterface<Object> resultType) {
		value hierarchy=typeHierarchy(type(source));
		assert(exists sourceType=hierarchy.allParent
			.narrow<ClassOrInterface<Object>>()
				.find((ClassOrInterface<Anything> element) => element.caseValues.contains(source)));
		
		assert(exists index=sourceType.caseValues.indexesWhere((Object element) => element==source).first);
		if(exists selectedObject=resultType.caseValues.get(index)){
			return selectedObject;
		}
		throw ConvertionException(source, resultType,Exception("No such index: ``index``, in case types of ``resultType``"));
	}
	
	matcher=> object satisfies EnumToEnumConverter.Matcher{
		shared actual Boolean match(Object source, ClassOrInterface<Object> resultType) {
			value sourceType = type(source);
			if(sourceType.declaration.anonymous && !resultType.caseValues.empty){
				return true;
			}
			return false;
		}
		
		shared actual Integer priority => 1;
		
		
	};
	
	
	
}
