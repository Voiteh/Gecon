import ceylon.language.meta.model {
	ClassOrInterface,
	Type
}
import ceylon.language.meta {
	type
}


import herd.convertx.core.util {
	typeHierarchy
}
import herd.convertx.api.operation {
	Convertion,
	ConvertionError,
	Delegator,
	wired
}
import herd.convertx.api.component {
	Converter
}

shared wired
class EnumToEnumConverter() satisfies Converter<Object,Object> {
	shared actual Object convert(Delegator delegator, Object source, Type<Object> resultType) {
		assert(is ClassOrInterface<Object> resultType);
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
	
	shared actual Convertion<Object,Object,Type<Object>>.Matcher? matcher => object satisfies Convertion<Object,Object,Type<Object>>.Matcher{
		shared actual Boolean match(Object source, Type<Object> resultType) {
			if (is ClassOrInterface<Object> resultType) {
				value sourceType = type(source);
				if (sourceType.declaration.anonymous && !resultType.caseValues.empty) {
					return true;
				}
			}
			return false;
		}
		
		shared actual Integer priority => 1;	
	};
}

