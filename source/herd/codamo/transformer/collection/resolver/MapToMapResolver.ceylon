import ceylon.collection {
	HashMap
}
import ceylon.language.meta.model {
	Class,
	ClassOrInterface
}

import herd.codamo.api.core.transformer {
	Resolver,
	Delegator,
	Matchable
}
import herd.codamo.api.core.util {
	typeHierarchy
}
"Resolves [[Map]] to [[HashMap]]"
tagged("Generic")
by("Wojciech Potiopa")
shared class MapToMapResolver() extends Resolver<Map<>,Map<>,ClassOrInterface<Map<>>>() {
	
	shared actual Class<Map<>,Nothing> resolve(Delegator delegator,Map<> input,ClassOrInterface<Map<>> outputType) {
		value hierarchy = typeHierarchy(outputType);
		assert (exists iterableType = hierarchy.findByDeclaration(`interface Map`));
		assert (exists keyType = iterableType.typeArgumentList.first);
		assert (exists itemType = iterableType.typeArgumentList.rest.first);
		return `class HashMap`.classApply<Map<>>(keyType, itemType);
	}
	
	matchable=> object satisfies Matchable<Map<>,ClassOrInterface<Map<>>>{
		shared actual Boolean predicate(Map<Object,Anything> source, ClassOrInterface<Map<Object,Anything>> resultType) => true;
		
		shared actual Integer priority =1;
		
		
	};
	
}

