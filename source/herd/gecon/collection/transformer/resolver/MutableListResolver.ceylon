import ceylon.collection {
	ArrayList,
	ListMutator
}
import ceylon.language.meta.model {
	Class,
	ClassOrInterface
}

import herd.gecon.core.api.transformer {
	Resolver,
	Delegator}
"Resolves any iterable to [[ArrayList]]"
tagged("Generic")
by("Wojciech Potiopa")
shared class MutableListResolver() extends Resolver<{Anything*},List<>,ClassOrInterface<List<>>>() {
	
	shared actual Class<List<>,Nothing> resolve(Delegator delegator,{Anything*} input, ClassOrInterface<List<>> outputType) {
		value typeForIterable = iterableTypeArgument(outputType);
		return `class ArrayList`.classApply<List<>>(typeForIterable);
	}

	matcher => Matcher{
		Boolean predicate({Anything*} source, ClassOrInterface<List<Anything>> resultType) => resultType.subtypeOf(`ListMutator<Nothing>`);
		Integer priority =1;
	};

}
