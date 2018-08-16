import ceylon.collection {
	HashMap
}
import ceylon.language.meta.model {
	Class,
	ClassOrInterface
}
import herd.convertx.core.api.component {
	Resolver,
	Component
}
import herd.convertx.core.util {
	typeHierarchy
}

service (`interface Component`)
shared class MapToMapResolver() satisfies Resolver<Map<>> {
	
	shared actual Class<Map<>,Nothing> resolve(Map<> input,ClassOrInterface<Map<>> outputType) {
		value hierarchy = typeHierarchy(outputType);
		assert (exists iterableType = hierarchy.findByDeclaration(`interface Map`));
		assert (exists keyType = iterableType.typeArgumentList.first);
		assert (exists itemType = iterableType.typeArgumentList.rest.first);
		return `class HashMap`.classApply<HashMap<Anything,Nothing>>(keyType, itemType);
	}
	matcher => object satisfies MapToMapResolver.Matcher {
		
		shared actual Integer priority => 1;
		shared actual Boolean match(Map<Object,Anything> input, ClassOrInterface<Map<Object,Anything>> outputType) => true;
		
	};
}
