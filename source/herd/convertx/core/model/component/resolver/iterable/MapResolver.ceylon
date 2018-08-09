import ceylon.collection {
	HashMap
}
import ceylon.language.meta.model {
	Class,
	ClassOrInterface,
	Interface
}
import herd.convertx.core.api.component {
	Resolver,
	Component
}
import herd.convertx.core.util {
	typeHierarchy
}

service (`interface Component`)
shared class MapResolver() satisfies Resolver<Map<>> {
	
	shared actual Class<Map<>,Nothing> resolve(ClassOrInterface<Map<>> type) {
		value hierarchy = typeHierarchy(type);
		assert (exists iterableType = hierarchy.findByDeclaration(`interface Map`));
		assert (exists keyType = iterableType.typeArgumentList.first);
		assert (exists itemType = iterableType.typeArgumentList.rest.first);
		return `class HashMap`.classApply<HashMap<Anything,Nothing>>(keyType, itemType);
	}
	matcher => object satisfies MapResolver.Matcher {
		shared actual Boolean match(ClassOrInterface<Map<>> inputType) => inputType is Interface<{Anything*}>;
		
		shared actual Integer priority => 1;
	};
}
