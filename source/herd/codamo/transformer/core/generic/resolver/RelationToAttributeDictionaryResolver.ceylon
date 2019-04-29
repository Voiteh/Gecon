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
	AttributeDictionary,
	Dictionary
}


shared class RelationToAttributeDictionaryResolver() extends Resolver<Relation<Object, Object>, Dictionary<Object,Anything>, Type<Dictionary<Object,Anything>>>(){
	shared actual Class<Dictionary<Object,Anything>,Nothing> resolve(Delegator delegator, Relation<Object,Object> input, Type<Dictionary<Object,Anything>> outputType) {
		return `AttributeDictionary`;
	}
	
	matchable=object satisfies Matchable<Relation<Object,Object>, Type<Dictionary<Object,Anything>>>{
		shared actual Boolean predicate(Relation<Object,Object> source, Type<Dictionary<Object,Anything>> resultType) {
			return true;
		}
		
		shared actual Integer priority => 0;
		
		
	};
	
}