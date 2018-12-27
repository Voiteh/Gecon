import herd.codamo.api.core.transformer {
	Resolver,
	Delegator,
	Resolvance
}
import ceylon.language.meta.model {
	Class,
	Type
}
shared class AnythingResolver() satisfies Resolver<Anything, Anything>{
	shared actual Class<Anything,Nothing> resolve(Delegator delegator, Anything input, Type<Anything> outputType) {
		switch(input)
		case (is Object) {
			return	`String`;
		}
		case (is Null) {
			return `Null`;
		}
	}
	
	
	shared actual Resolvance<Anything,Anything,Type<Anything>>.Matcher? matcher => object satisfies Resolvance<Anything, Anything, Type<Anything>>.Matcher{
		shared actual Boolean match(Anything input, Type<Anything> outputType) => input is Null|String;
		
		shared actual Integer priority => 0;
		
		
	};
}