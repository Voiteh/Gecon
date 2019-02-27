
import ceylon.language.meta {
	type
}
import ceylon.language.meta.model {
	ClassOrInterface,
	Type,
	Class
}

import herd.codamo.api.core.meta {
	Relation,
	ObjectRelation
}
import herd.codamo.api.core.transformer {
	Converter,
	Delegator,
	Matchable
}
"Converts Key->[[ClassOrInterface]]<<Item>> to [[Relation]]<<Key,Item>>."
tagged("Generic")
by("Wojciech Potiopa")
shared class EntryToRelationConverter() extends Converter<Object->ClassOrInterface<>,Relation<>>(){
	shared actual Relation<Anything,Anything> convert(Delegator delegator, Object->ClassOrInterface<Anything> source, Type<Relation<Anything,Anything>> resultType) {
			assert(exists classType=source.item.typeArgumentList.first);
			value clazz=`class ObjectRelation`.classApply<Relation<>>(type(source.key),classType);
			return clazz.apply(source.key,classType);
	}

	matchable => object satisfies Matchable<Object->ClassOrInterface<>,Type<Relation<Anything,Anything>>>{
		shared actual Boolean predicate(Object->ClassOrInterface<Anything> source, Type<Relation<Anything,Anything>> resultType) => source.item is Class<>;
		
		shared actual Integer priority =1;
		
		
	};

}
