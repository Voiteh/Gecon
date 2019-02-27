import ceylon.language.meta {
	type
}
import ceylon.language.meta.model {
	ClassOrInterface
}

import herd.codamo.api.core.transformer {
	Converter,
	Delegator,
	Matchable
}


"Converts string constants into anymous object instances. This implementation is naive but can handle simple constants mapping."
shared class JsonStringToEnumeratedObjectConverter() extends Converter<String,Object,ClassOrInterface<Object>>() {
	shared actual Object convert(Delegator delegator, String source, ClassOrInterface<Object> resultType) {
		assert (exists objectValue = resultType.caseValues.find((Object elem) => type(elem).declaration.name == source));
		return objectValue;
	}
	matchable => object satisfies Matchable<String,ClassOrInterface<Object>> {
		shared actual Boolean predicate(String source, ClassOrInterface<Object> resultType) {
			if (!resultType.caseValues.empty, exists objectValue = resultType.caseValues.find((Object elem) => type(elem).declaration.name == source)) {
				return true;
			}
			return false;
		}
		
		shared actual Integer priority = 1;
	};
}
