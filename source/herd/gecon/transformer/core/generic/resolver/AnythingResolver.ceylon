
import ceylon.language.meta {
	type
}
import ceylon.language.meta.model {
	Class,
	Type
}

import herd.gecon.api.transformer {
	Resolver,
	Delegator
}

"Resolves [[Anything]] type to [[Object]]|[[Null]] depending on input"
tagged("Generic")
by("Wojciech Potiopa")
shared class AnythingResolver() extends Resolver<Anything,Anything,Type<Anything>>() {
	shared actual Class<Anything,Nothing> resolve(Delegator delegator, Anything input, Type<Anything> outputType) {
		
		switch (input)
		case (is Object) {
			assert (is Class<> inputType = type(input));
			if (inputType.declaration.abstract) {
				return `Object`;
			}
			return inputType;
		}
		case (is Null) {
			return `Null`;
		}
	}
	
	matcher=> Matcher{
		Boolean predicate(Anything source, Type<Anything> resultType) => resultType == `Anything`;
		Integer priority =0;
	};
	

	
}
