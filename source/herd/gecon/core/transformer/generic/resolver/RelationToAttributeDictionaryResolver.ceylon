import ceylon.language.meta.model {
	Type,
	Class
}
import herd.gecon.core.api.transformer {
	Resolver,
	Delegator,
	Relation
}
import herd.gecon.core.api.dictionary {
	AttributeDictionary,
	Dictionary
}

shared class RelationToAttributeDictionaryResolver() extends Resolver<Relation<Object,Object>,Dictionary<Object,Anything>,Type<Dictionary<Object,Anything>>>() {
	shared actual Class<Dictionary<Object,Anything>,Nothing> resolve(Delegator delegator, Relation<Object,Object> input, Type<Dictionary<Object,Anything>> outputType) {
		return `AttributeDictionary`;
	}
	
	matcher => Matcher {
		Boolean predicate(Relation<Object,Object> source, Type<Dictionary<Object,Anything>> resultType) {
			return true;
		}
		Integer priority => 0;
	};
}
