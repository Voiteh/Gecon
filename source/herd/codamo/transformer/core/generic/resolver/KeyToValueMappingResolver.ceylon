import ceylon.language.meta.model {
	Class,
	ClassOrInterface
}


import herd.codamo.api.core.transformer {
	Resolver,
	Delegator,
	Matchable,
	Relation
}
import herd.codamo.api.core.dictionary {
	Dictionary,
	KeyToValueDictionary
}

"Resolves [[Dictionary]] from [[Relation]]"
tagged("Generic")
by("Wojciech Potiopa")
shared class KeyToValueMappingResolver() extends Resolver<Relation<Object,Map<String,Anything>>,Dictionary<>,ClassOrInterface<Dictionary<>>>() {
	shared actual Class<Dictionary<>,Nothing> resolve(Delegator delegator, Relation<Object,Map<String,Anything>> type, ClassOrInterface<Dictionary<>> outputType) => `KeyToValueDictionary`;
	
	matchable => object satisfies Matchable<Relation<Object,Map<String,Anything>>,ClassOrInterface<Dictionary<>>>{
		shared actual Boolean predicate(Relation<Object,Map<String,Anything>> source, ClassOrInterface<Dictionary<>> resultType) {
			return true;
		}
		
		shared actual Integer priority =1;
		
		
	};
}
