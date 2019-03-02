import ceylon.collection {
	ArrayList,
	ListMutator
}
import ceylon.language.meta.model {
	Class,
	ClassOrInterface
}

import herd.codamo.api.core.transformer {
	Resolver,
	Delegator,
	Matchable
}
"Resolves any iterable to [[ArrayList]]"
tagged("Generic")
by("Wojciech Potiopa")
shared class MutableListResolver() extends Resolver<{Anything*},List<>,ClassOrInterface<List<>>>() {
	
	shared actual Class<List<>,Nothing> resolve(Delegator delegator,{Anything*} input, ClassOrInterface<List<>> outputType) {
		value typeForIterable = iterableTypeArgument(outputType);
		return `class ArrayList`.classApply<List<>>(typeForIterable);
	}

	matchable => object satisfies Matchable<{Anything*},ClassOrInterface<List<>>>{
		shared actual Boolean predicate({Anything*} source, ClassOrInterface<List<Anything>> resultType) => resultType.subtypeOf(`ListMutator<Nothing>`);
		
		shared actual Integer priority =1;
		
		
	};

}
