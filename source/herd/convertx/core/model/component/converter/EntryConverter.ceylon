import herd.convertx.core.util {
	typeHierarchy
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.component {
	wired,
	Converter
}
import ceylon.language.meta.model {
	Class,
	Type
}

shared wired class EntryConverter() satisfies Converter<Object->Anything,Object->Anything> {
	shared actual Object->Anything convert(Context context, Object->Anything source, Type<Object->Anything> resultType) {
		value key = source.key;
		value item = source.item;
		value resolvedType=context.resolve(source,resultType);
		assert(is Class<Entry<Object,Anything>> entryType=typeHierarchy(resolvedType).findByDeclaration(`class Entry`));
		assert (exists destKeyType = entryType.typeArgumentList.first);
		assert (exists destItemType = entryType.typeArgumentList.rest.first);
		
		value convertedKey = context.convert(key, destKeyType);
		value convertedItem = context.convert(item, destItemType);
		
		value instance = context.create(resolvedType, { convertedKey, convertedItem });
		return instance;
	}
	matcher => object satisfies EntryConverter.Matcher{
		shared actual Boolean match(Object->Anything source, Type<Object->Anything> resultType) => resultType is Class<Object->Anything>;
		
		shared actual Integer priority => 1;
		
		
	};
	
}