import ceylon.language.meta.model {
	Class,
	ClassOrInterface
}
import herd.gecon.core.api.transformer {
	Relation,
	Creator,
	Delegator}
import ceylon.language.meta {
	type
}
shared class RelationCreator() extends Creator<Object->ClassOrInterface<>,Relation<>>(){
	shared actual Relation<Anything,Anything> create(Delegator delegator, Object->ClassOrInterface<> arguments, Class<Relation<Anything,Anything>,Nothing> kind) {
		value relation = `class Relation`.classApply<Relation<>>(type(arguments.key),arguments.item);
		return relation.apply(arguments.key,arguments.item);
	}
	
	
	shared actual Matcher matcher => Matcher{
		Boolean predicate(Object->ClassOrInterface<> source, Class<Relation<Anything,Anything>> resultType) => source.item is Class<>;
		Integer priority => 0;
	};
}