import ceylon.language.meta {
	type
}
import ceylon.language.meta.model {
	ClassOrInterface
}

import herd.codamo.api.core.transformer {
	Converter,
	ConvertionError,
	Delegator,
	Matchable
}
import herd.codamo.api.core.util {
	typeHierarchy
}

"Converts object instance to other object instances. Takes source object index  and tries to extract object value from Result type with the same index."
tagged("Generic")
by("Wojciech Potiopa")
shared class  EnumToEnumConverter() extends Converter<Object,Object,ClassOrInterface<Object>>() {
	shared actual Object convert(Delegator delegator, Object source, ClassOrInterface<Object> resultType) {
		value hierarchy = typeHierarchy(type(source));
		assert (exists sourceType = hierarchy.allParent
				.narrow<ClassOrInterface<Object>>()
				.find((ClassOrInterface<Anything> element) => element.caseValues.contains(source)));
		
		assert (exists index = sourceType.caseValues.indexesWhere((Object element) => element == source).first);
		if (exists selectedObject = resultType.caseValues.get(index)) {
			return selectedObject;
		}
		throw ConvertionError(source, resultType, Exception("No such index: ``index``, in case types of ``resultType``"));
	}
	
	matchable => object satisfies Matchable<Object,ClassOrInterface<Object>>{
		shared actual Boolean predicate(Object source, ClassOrInterface<Object> resultType) {
			value sourceType = type(source);
			if (sourceType.declaration.anonymous && !resultType.caseValues.empty) {
				return true;
			}
			return false;
		}
		
		shared actual Integer priority =1;
		
		
	};
	

}

