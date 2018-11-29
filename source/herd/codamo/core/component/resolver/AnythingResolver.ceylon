
import ceylon.language.meta.model {
	Class,
	Type
}

import ceylon.language.meta {
	type
}
import herd.codamo.api.operation {
	Resolvance,
	Delegator,
	provided
}
import herd.codamo.api.component {
	Resolver
}

"Resolves [[Anything]] type to [[Object]]|[[Null]] depending on input"
tagged("Generic")
by("Wojciech Potiopa")
shared provided class AnythingResolver() satisfies Resolver<Anything,Anything> {
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
	shared actual Resolvance<Anything,Anything,Type<Anything>>.Matcher? matcher => object satisfies Resolvance<Anything,Anything,Type<Anything>>.Matcher{
		shared actual Boolean match(Anything input, Type<Anything> outputType) => outputType == `Anything`;
		
		shared actual Integer priority => 0;

	};
	
}
