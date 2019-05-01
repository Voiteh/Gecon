import ceylon.language.meta.model {
	Class,
	ClassOrInterface
}

import herd.codamo.api.core.transformer {
	Resolver,
	Delegator}

"Whenever there is no need for resolvance, this [[Resolver]] will be used."
shared class ResolvedTypeResolver() extends Resolver<Anything,Anything,ClassOrInterface<>>() {
	shared actual Class<Anything,Nothing> resolve(Delegator delegator, Anything input, ClassOrInterface<Anything> outputType) {
		assert (is Class<> outputType);
		return outputType;
	}
	
	matcher =>Matcher{
		Boolean predicate(Anything source, ClassOrInterface<Anything> resultType) {
			if(is Class<> resultType,!resultType.declaration.abstract){
				return true;
			}
			return false;
		}
		
		Integer priority =runtime.maxIntegerValue;
	};
	

	
}