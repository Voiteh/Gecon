import ceylon.language.meta {
	type
}
import ceylon.language.meta.model {
	ClassOrInterface
}

import herd.codamo.api.core.transformer {
	Converter,
	Delegator
}
import herd.type.support {

	flat
}

"Converts object instance to other object instances. Takes source object index  and tries to extract object value from Result type with the same index."
tagged("Generic")
by("Wojciech Potiopa")
shared class  EnumToEnumConverter() extends Converter<Object,Object,ClassOrInterface<Object>>() {
	shared actual Object convert(Delegator delegator, Object source, ClassOrInterface<Object> resultType) {
	assert(exists sourceParent=	flat.types(type(source))
		.narrow<ClassOrInterface<Object>>()
		.find((ClassOrInterface<Object> element) => element.caseValues.contains(source)));
		assert (exists index = sourceParent.caseValues.indexesWhere((Object element) => element == source).first);
		if (exists selectedObject = resultType.caseValues.get(index)) {
			return selectedObject;
		}
		throw Error(source, resultType, Exception("No such index: ``index``, in case types of ``resultType``"));
	}
	
	shared actual Matcher matcher => Matcher {
		Boolean predicate(Object source, ClassOrInterface<Object> resultType) {
			value sourceType = type(source);
			if (sourceType.declaration.anonymous && !resultType.caseValues.empty) {
				return true;
			}
			return false;
		}
		Integer priority =1;
	};
	
	

}

