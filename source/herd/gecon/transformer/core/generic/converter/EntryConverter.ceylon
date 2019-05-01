import ceylon.language.meta.model {
	Class,
	Type
}

import herd.gecon.api.transformer {
	Converter,
	Delegator
}
import herd.type.support {
	flat
}

"Converts an [[Entry]] type value, into othe [[Entry]] type value. 
 
 Given Source: Key->Item, result type: Type< KeyResult -> ItemResult >.
 
 Key converted to KeyResult, Item to ItemResult  "
tagged ("Generic")
by ("Wojciech Potiopa")
shared class EntryConverter() extends Converter<Object->Anything,Object->Anything,Type<Object->Anything>>() {
	shared actual Object->Anything convert(Delegator delegator, Object->Anything source, Type<Object->Anything> resultType) {
		value key = source.key;
		value item = source.item;
		value resolvedType = delegator.resolve(source, resultType);
		assert (is Class<Entry<Object,Anything>> entryType = flat.types(resolvedType)
				.narrow<Class<>>()
				.find((Class<> element) => element.declaration.equals(`class Entry`)));
		assert (exists destKeyType = entryType.typeArgumentList.first);
		assert (exists destItemType = entryType.typeArgumentList.rest.first);
		
		value convertedKey = delegator.convert(key, destKeyType);
		value convertedItem = delegator.convert(item, destItemType);
		
		value instance = delegator.create(resolvedType, { convertedKey, convertedItem });
		return instance;
	}
	
	shared actual Matcher matcher => Matcher{
		Boolean predicate(Object->Anything source, Type<Object->Anything> resultType) => resultType is Class<Object->Anything>;
		Integer priority = 1;
	};
}
