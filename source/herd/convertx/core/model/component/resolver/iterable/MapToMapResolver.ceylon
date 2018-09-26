import ceylon.collection {
	HashMap
}
import ceylon.language.meta.model {
	Class,
	ClassOrInterface,
	Type
}
import herd.convertx.api.component {
	Resolver,
	wired
}
import herd.convertx.core.util {
	typeHierarchy
}
import herd.convertx.api {
	Context
}

shared wired class MapToMapResolver() satisfies Resolver<Map<>,Map<>> {
	
	shared actual Class<Map<>,Nothing> resolve(Context context,Map<> input,Type<Map<>> outputType) {
		assert(is ClassOrInterface<Map<>> outputType);
		value hierarchy = typeHierarchy(outputType);
		assert (exists iterableType = hierarchy.findByDeclaration(`interface Map`));
		assert (exists keyType = iterableType.typeArgumentList.first);
		assert (exists itemType = iterableType.typeArgumentList.rest.first);
		return `class HashMap`.classApply<Map<>>(keyType, itemType);
	}
	matcher => object satisfies MapToMapResolver.Matcher {
		
		shared actual Integer priority => 1;
		shared actual Boolean match(Map<> input, Type<Map<>> outputType) => outputType is ClassOrInterface<Map<>>;
		
	};
}
