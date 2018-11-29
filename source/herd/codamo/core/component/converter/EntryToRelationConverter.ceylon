
import ceylon.language.meta.model {
	ClassOrInterface,
	Type,
	Class
}
import herd.codamo.api.meta {
	Relation,
	ObjectRelation
}

import ceylon.language.meta {
	type
}
import herd.codamo.api.operation {
	Convertion,
	Delegator,
	provided
}
import herd.codamo.api.component {
	Converter
}
"Converts Key->[[ClassOrInterface]]<<Item>> to [[Relation]]<<Key,Item>>."
tagged("Generic")
by("Wojciech Potiopa")
shared provided class EntryToRelationConverter() satisfies Converter<Object->ClassOrInterface<>,Relation<>>{
	shared actual Relation<Anything,Anything> convert(Delegator delegator, Object->ClassOrInterface<Anything> source, Type<Relation<Anything,Anything>> resultType) {
			assert(exists classType=source.item.typeArgumentList.first);
			value clazz=`class ObjectRelation`.classApply<Relation<>>(type(source.key),classType);
			return clazz.apply(source.key,classType);
	}

	shared actual Convertion<Object->ClassOrInterface<Anything>,Relation<Anything,Anything>,Type<Relation<Anything,Anything>>>.Matcher? matcher => object satisfies Convertion<Object->ClassOrInterface<Anything>,Relation<Anything,Anything>,Type<Relation<Anything,Anything>>>.Matcher{
		
		shared actual Boolean match(Object->ClassOrInterface<Anything> source, Type<Relation<Anything,Anything>> resultType) =>  source.item is Class<>;
		
		shared actual Integer priority => 1;

	};
}
