import ceylon.language.meta.model {
	Class,
	Type
}


import herd.codamo.api.operation {
	Resolvance,
	Delegator,
	wired
}
import herd.codamo.api.component {
	Resolver
}

"Whenever there is no need for resolvance, this [[Resolver]] will be used."
shared wired class ResolvedTypeResolver() satisfies Resolver<Anything,Anything> {
	shared actual Class<Anything,Nothing> resolve(Delegator delegator, Anything input, Type<Anything> outputType) {
		assert (is Class<> outputType);
		return outputType;
	}
	shared actual Resolvance<Anything,Anything,Type<Anything>>.Matcher? matcher => object satisfies Resolvance<Anything,Anything,Type<Anything>>.Matcher{
		
		shared actual Integer priority => runtime.maxIntegerValue;
		shared actual Boolean match(Anything input, Type<Anything> outputType) {
			if(is Class<> outputType,!outputType.declaration.abstract){
				return true;
			}
			return false;
		}		
	};
	
}