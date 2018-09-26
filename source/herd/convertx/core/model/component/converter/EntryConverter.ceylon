import herd.convertx.core.util {
	typeHierarchy
}
import herd.convertx.api {
	Context,
	Converter,
	wired
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
shared actual Converter<Object->Anything,Object->Anything>.Matcher? matcher => object satisfies Converter<Object->Anything,Object->Anything>.Matcher{
	
	shared actual Boolean match(Object->Anything source, Type<Object->Anything> resultType) => resultType is Class<Object->Anything>;
	
	shared actual Integer priority => 1;
	
};	
}