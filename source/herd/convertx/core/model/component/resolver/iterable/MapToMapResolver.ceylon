import ceylon.collection {
	HashMap
}
import ceylon.language.meta.model {
	Class,
	ClassOrInterface,
	Type
}

import herd.convertx.core.util {
	typeHierarchy
}
import herd.convertx.api {
	wired
}
import herd.convertx.api.operation {
	Resolvance,
	Delegator
}
import herd.convertx.api.component {
	Resolver
}

shared wired class MapToMapResolver() satisfies Resolver<Map<>,Map<>> {
	
	shared actual Class<Map<>,Nothing> resolve(Delegator delegator,Map<> input,Type<Map<>> outputType) {
		assert(is ClassOrInterface<Map<>> outputType);
		value hierarchy = typeHierarchy(outputType);
		assert (exists iterableType = hierarchy.findByDeclaration(`interface Map`));
		assert (exists keyType = iterableType.typeArgumentList.first);
		assert (exists itemType = iterableType.typeArgumentList.rest.first);
		return `class HashMap`.classApply<Map<>>(keyType, itemType);
	}
	
	shared actual Resolvance<Map<Object,Anything>,Map<Object,Anything>,Type<Map<Object,Anything>>>.Matcher? matcher => object satisfies Resolvance<Map<Object,Anything>,Map<Object,Anything>,Type<Map<Object,Anything>>>.Matcher{
		shared actual Integer priority => 1;
		shared actual Boolean match(Map<> input, Type<Map<>> outputType) => outputType is ClassOrInterface<Map<>>;
	};
}

