import herd.codamo.core.util {
	typeHierarchy
}

import ceylon.language.meta.model {
	Class,
	Type
}
import herd.codamo.api.operation {
	Convertion,
	Delegator,
	wired
}
import herd.codamo.api.component {
	Converter
}


"Converts an [[Entry]] type value, into othe [[Entry]] type value. 
 
 Given Source: Key->Item, result type: Type< KeyResult -> ItemResult >.
 
 Key converted to KeyResult, Item to ItemResult  "
tagged("Generic")
by("Wojciech Potiopa")
shared wired class EntryConverter() satisfies Converter<Object->Anything,Object->Anything> {
	shared actual Object->Anything convert(Delegator delegator, Object->Anything source, Type<Object->Anything> resultType) {
		value key = source.key;
		value item = source.item;
		value resolvedType=delegator.resolve(source,resultType);
		assert(is Class<Entry<Object,Anything>> entryType=typeHierarchy(resolvedType).findByDeclaration(`class Entry`));
		assert (exists destKeyType = entryType.typeArgumentList.first);
		assert (exists destItemType = entryType.typeArgumentList.rest.first);
		
		value convertedKey = delegator.convert(key, destKeyType);
		value convertedItem = delegator.convert(item, destItemType);
		
		value instance = delegator.create(resolvedType, { convertedKey, convertedItem });
		return instance;
	}
	
	shared actual Convertion<Object->Anything,Object->Anything,Type<Object->Anything>>.Matcher? matcher => object satisfies Convertion<Object->Anything,Object->Anything,Type<Object->Anything>>.Matcher{
		shared actual Boolean match(Object->Anything source, Type<Object->Anything> resultType) => resultType is Class<Object->Anything>;
		
		shared actual Integer priority => 1;		
	};
	
}

