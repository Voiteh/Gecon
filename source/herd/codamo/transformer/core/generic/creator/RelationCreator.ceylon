import ceylon.language.meta.model {
	Class,
	ClassOrInterface
}
import herd.codamo.api.core.transformer {
	Relation,
	Creator,
	Delegator,
	Matchable
}
import ceylon.language.meta {
	type
}
shared class RelationCreator() extends Creator<Object->ClassOrInterface<>,Relation<>>(){
	shared actual Relation<Anything,Anything> create(Delegator delegator, Object->ClassOrInterface<> arguments, Class<Relation<Anything,Anything>,Nothing> kind) {
		value relation = `class Relation`.classApply<Relation<>>(type(arguments.key),arguments.item);
		return relation.apply(arguments.key,arguments.item);
	}
	
	
	matchable = object satisfies Matchable<Object->ClassOrInterface<>, Class<Relation<>>>{
		shared actual Boolean predicate(Object->ClassOrInterface<> source, Class<Relation<Anything,Anything>> resultType) => source.item is Class<>;
		
		shared actual Integer priority => 0;
		
		
	};
}