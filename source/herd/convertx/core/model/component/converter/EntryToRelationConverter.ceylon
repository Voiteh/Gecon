
import ceylon.language.meta.model {
	ClassOrInterface,
	Type,
	Class
}
import herd.convertx.api.meta {
	Relation,
	ObjectRelation
}
import herd.convertx.api {
	Context,
	Converter,
	wired
}
import ceylon.language.meta {
	type
}

wired
shared class EntryToRelationConverter() satisfies Converter<Object->ClassOrInterface<>,Relation<>>{
	shared actual Relation<Anything,Anything> convert(Context context, Object->ClassOrInterface<Anything> source, Type<Relation<Anything,Anything>> resultType) {
			assert(exists classType=source.item.typeArgumentList.first);
			value clazz=`class ObjectRelation`.classApply<Relation<>>(type(source.key),classType);
			return clazz.apply(source.key,classType);
	}
	
	matcher => object satisfies EntryToRelationConverter.Matcher{
		shared actual Boolean match(Object->ClassOrInterface<Anything> source, Type<Relation<Anything,Anything>> resultType) =>  source.item is Class<>;
		
		shared actual Integer priority => 1;
		
		
	};
	
}