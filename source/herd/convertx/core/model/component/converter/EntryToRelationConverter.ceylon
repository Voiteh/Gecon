import herd.convertx.core.api.component {
	wired,
	Converter
}
import ceylon.language.meta.model {
	ClassOrInterface,
	Type,
	Class
}
import herd.convertx.core.api.meta {
	Relation
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta {
	type
}
import herd.convertx.core.model.meta {
	ObjectRelation
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