import ceylon.language.meta.model {
	Class,
	Type
}

import herd.gecon.core.api.transformer {
	Resolver,
	Delegator
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
	
	matcher =>Matcher{
		Boolean predicate(Anything source, Type<Anything> resultType) => source is Null|String;
		Integer priority =0;
	};
	
	
	
}