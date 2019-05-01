import ceylon.language.meta.model {
	ClassOrInterface,
	Type,
	Interface
}

import herd.codamo.api.core.transformer {
	Converter,
	Delegator,
	Matchable
}
import herd.codamo.api.core.util {
	runtimeCall
}
import herd.type.support {

	flat
}

"Converts [[Map]] value to other [[Map]] type. For Example [[`Map<Boolean,Integer>`]] into [[`Map<String,String>`]]."
by("Wojciech Potiopa")
shared class MapToMapConverter() extends Converter<Map<>,Map<>,ClassOrInterface<Map<>>>() {
	shared actual Map<Object,Anything> convert(Delegator delegator, Map<Object,Anything> source, ClassOrInterface<Map<Object,Anything>> resultType){
		value resolvedType=delegator.resolve(source,resultType);
	assert(exists explictMapType=	flat.types(resolvedType)
		.narrow<Interface<>>()
			.find((Interface<Anything> element) => element.declaration==`interface Map`));
		assert(is Type<Object>keyDestination=explictMapType.typeArgumentList.first);
		assert(exists itemDestination=explictMapType.typeArgumentList.rest.first);
		value entryType=`class Entry`.classApply<Entry<Object,Anything>>(keyDestination,itemDestination);
		value args = source.collect((Object elementKey -> Anything elementItem) {
			value resolvedKeyType=delegator.resolve(elementKey, keyDestination);
			value convertedKey = delegator.convert(elementKey, resolvedKeyType);
			value resolvedItemType=delegator.resolve(elementItem, itemDestination);
			value convertedItem = delegator.convert(elementItem, resolvedItemType);
			value entryType=`class Entry`.classApply<Entry<Object,Anything>>(keyDestination,itemDestination);
			return delegator.create(entryType, {convertedKey,convertedItem});
		});
		
		value creatorArgs=runtimeCall.iterable.narrow(args, entryType );
		return delegator.create(resolvedType, creatorArgs);
	}
	
	matchable=> object satisfies Matchable<Map<Object,Anything>,ClassOrInterface<Map<Object,Anything>>>{
		shared actual Boolean predicate(Map<Object,Anything> source, ClassOrInterface<Map<Object,Anything>> resultType) => true;
		
		shared actual Integer priority =2;
		
		
	};
	
	
}

