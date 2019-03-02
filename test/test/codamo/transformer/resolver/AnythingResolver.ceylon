import ceylon.language.meta.model {
	Class,
	Type
}

import herd.codamo.api.core.transformer {
	Resolver,
	Delegator,
	Matchable
}
shared class AnythingResolver() extends Resolver<Anything, Anything,Type<Anything>>(){
	shared actual Class<Anything,Nothing> resolve(Delegator delegator, Anything input, Type<Anything> outputType) {
		switch(input)
		case (is Object) {
			return	`String`;
		}
		case (is Null) {
			return `Null`;
		}
	}
	
	matchable => object satisfies Matchable<Anything,Type<>>{
		shared actual Boolean predicate(Anything source, Type<Anything> resultType) => source is Null|String;
		
		shared actual Integer priority =0;
		
		
	};
	
	
	
}