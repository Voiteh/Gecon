import ceylon.collection {
	ArrayList,
	ListMutator
}
import ceylon.language.meta.model {
	Class,
	ClassOrInterface,
	Type
}


import herd.codamo.api.operation {
	Resolvance,
	Delegator,
	provided
}
import herd.codamo.api.component {
	Resolver
}
"Resolves any iterable to [[ArrayList]]"
tagged("Generic")
by("Wojciech Potiopa")
shared provided class MutableListResolver() satisfies Resolver<{Anything*},List<>> {
	shared actual Class<List<>,Nothing> resolve(Delegator delegator,{Anything*} input, Type<List<>> outputType) {
		assert(is ClassOrInterface<List<>> outputType);
		value typeForIterable = iterableTypeArgument(outputType);
		return `class ArrayList`.classApply<List<>>(typeForIterable);
	}

	shared actual Resolvance<{Anything*},List<Anything>,Type<List<Anything>>>.Matcher? matcher => object satisfies Resolvance<{Anything*},List<Anything>,Type<List<Anything>>>.Matcher{
		
		shared actual Integer priority => 1;
		shared actual Boolean match({Anything*} input, Type<List<>> outputType) {
			return outputType is ClassOrInterface<List<>> && outputType.subtypeOf(`ListMutator<Nothing>`);
		}
	};
	
}
