import ceylon.language.meta.model {
	ClassOrInterface,
	Type
}
import herd.convertx.core.util {
	typeHierarchy,
	runtimeCall
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.component {
	TypedConverter,
	wired
}
wired
shared class MapToMapConverter() satisfies TypedConverter<Map<>,ClassOrInterface<Map<>>,Map<>> {
	shared actual Map<Object,Anything> convert(Context context, Map<Object,Anything> source, ClassOrInterface<Map<Object,Anything>> resultType){
		value resolvedType=context.resolve(source,resultType);
		assert(exists explictMapType = typeHierarchy(resolvedType).findByDeclaration(`interface Map`));
		assert(is Type<Object>keyDestination=explictMapType.typeArgumentList.first);
		assert(exists itemDestination=explictMapType.typeArgumentList.rest.first);
		value entryType=`class Entry`.classApply<Entry<Object,Anything>>(keyDestination,itemDestination);
		value args = source.map((Object elementKey -> Anything elementItem) {
			value resolvedKeyType=context.resolve(elementKey, keyDestination);
			value convertedKey = context.convert(elementKey, resolvedKeyType);
			value resolvedItemType=context.resolve(elementItem, itemDestination);
			value convertedItem = context.convert(elementItem, resolvedItemType);
			value entryType=`class Entry`.classApply<Entry<Object,Anything>>(keyDestination,itemDestination);
			return context.create(entryType, {convertedKey,convertedItem});
		});
		
		value creatorArgs=runtimeCall.iterable.narrow(args, entryType );
		return context.create(resolvedType, creatorArgs);
	}
	
	matcher => object satisfies MapToMapConverter.Matcher{
		shared actual Boolean match(Map<Object,Anything> source, ClassOrInterface<Map<Object,Anything>> resultType) => true;
		
		shared actual Integer priority => 2;
		
		
	};
	
}