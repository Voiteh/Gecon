import herd.convertx.core.util {
	typeHierarchy
}
import herd.convertx.api {
	wired
}
import ceylon.language.meta.model {
	Class,
	Type
}
import herd.convertx.api.operation {
	Convertion,
	Delegator
}
import herd.convertx.api.component {
	Converter
}

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

