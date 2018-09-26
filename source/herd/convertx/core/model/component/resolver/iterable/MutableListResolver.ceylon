import ceylon.collection {
	ArrayList,
	ListMutator
}
import ceylon.language.meta.model {
	Class,
	ClassOrInterface,
	Type
}
import herd.convertx.api.component {
	wired,
	Resolver
}
import herd.convertx.api {
	Context
}


shared wired class MutableListResolver() satisfies Resolver<{Anything*},List<>> {
	shared actual Class<List<>,Nothing> resolve(Context context,{Anything*} input, Type<List<>> outputType) {
		assert(is ClassOrInterface<List<>> outputType);
		value typeForIterable = iterableTypeArgument(outputType);
		return `class ArrayList`.classApply<List<>>(typeForIterable);
	}
	
	matcher => object satisfies MutableListResolver.Matcher {
		
		shared actual Integer priority => 1;
		shared actual Boolean match({Anything*} input, Type<List<>> outputType) {
			return outputType is ClassOrInterface<List<>> && outputType.subtypeOf(`ListMutator<Nothing>`);
		}
	};
}
