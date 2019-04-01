import ceylon.language.meta.model {
	Type,
	Class
}
import herd.codamo.api.core.transformer {
	Resolver,
	Matchable,
	Delegator,
	Relation
}
import herd.codamo.api.core.dictionary {
	AttributeDictionary
}


shared class RelationToAttributeDictionaryResolver() extends Resolver<Relation<Object, Object>, Map<Object,Anything>, Type<Map<Object,Anything>>>(){
	shared actual Class<Map<Object,Anything>,Nothing> resolve(Delegator delegator, Relation<Object,Object> input, Type<Map<Object,Anything>> outputType) => `AttributeDictionary`;
	
	matchable=object satisfies Matchable<Relation<Object,Object>, Type<Map<Object,Anything>>>{
		shared actual Boolean predicate(Relation<Object,Object> source, Type<Map<Object,Anything>> resultType) => true;
		
		shared actual Integer priority => 0;
		
		
	};
	
}