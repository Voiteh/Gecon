
import ceylon.language.meta.model {
	Type,
	Attribute,
	Model,
	Class
}

import herd.codamo.api.core.dictionary {
	Dictionary,
	AttributeDictionary
}

import herd.codamo.api.core.transformer {
	Resolver,
	Delegator,
	Matchable,
	Relation
}

"Resolves [[AttributeDictionary]] from [[Relation]]"
tagged("Generic")
by("Wojciech Potiopa")
shared class FromObjectToObjectRelationAttributeMappingResolver() extends Resolver<Relation<>,Dictionary<Model,Anything>,Type<Dictionary<Model,Anything>>>() {
	shared actual Class<Dictionary<Model,Anything>,Nothing> resolve(Delegator delegator, Relation<Anything,Anything> input, Type<Dictionary<Model,Anything>> outputType) => `AttributeDictionary`;
	
	
	
	shared actual Matchable<Relation<Anything,Anything>,Type<Dictionary<Model,Anything>>>? matchable => object satisfies Matchable<Relation<Anything,Anything>,Type<Dictionary<Model,Anything>>>{
		shared actual Boolean predicate(Relation<Anything,Anything> source, Type<Dictionary<Model,Anything>> resultType) => resultType.subtypeOf(`Dictionary<Attribute<>,Anything>`);
		
		shared actual Integer priority => 0;
		
		
	};
	
}


