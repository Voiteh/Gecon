import ceylon.collection {
	HashMap
}
import ceylon.language.meta.model {
	Class,
	ClassOrInterface,
	Interface
}

import herd.codamo.api.core.transformer {
	Resolver,
	Delegator}
import herd.type.support {
	flat
}
"Resolves [[Map]] to [[HashMap]]"
tagged("Generic")
by("Wojciech Potiopa")
shared class MapToMapResolver() extends Resolver<Map<>,Map<>,ClassOrInterface<Map<>>>() {
	
	shared actual Class<Map<>,Nothing> resolve(Delegator delegator,Map<> input,ClassOrInterface<Map<>> outputType) {
		value typeArguments= flat.types(outputType). narrow<Interface<>>().find((Interface<Anything> element) => element.declaration.equals(`interface Map`))?.typeArgumentList;
		assert(exists keyType=typeArguments?.first);
		assert(exists itemType=typeArguments?.rest?.first);
		return `class HashMap`.classApply<Map<>>(keyType, itemType);
	}
	
	matcher=>Matcher{
		Boolean predicate(Map<Object,Anything> source, ClassOrInterface<Map<Object,Anything>> resultType) => true;
		Integer priority =1;
		
		
	};
	
}

