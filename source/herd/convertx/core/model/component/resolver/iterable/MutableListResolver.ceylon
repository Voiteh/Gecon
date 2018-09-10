import ceylon.collection {
	ArrayList,
	ListMutator
}
import ceylon.language.meta.model {
	Class,
	ClassOrInterface
}
import herd.convertx.core.api.component {
	wired,
	Resolver
}
import herd.convertx.core.api {
	Context
}


shared wired class MutableListResolver() satisfies Resolver<List<>,{Anything*}> {
	shared actual Class<List<>,Nothing> resolve(Context context,{Anything*} input, ClassOrInterface<List<>> outputType) {
		value typeForIterable = iterableTypeArgument(outputType);
		return `class ArrayList`.classApply<List<>>(typeForIterable);
	}
	
	matcher => object satisfies MutableListResolver.Matcher {
		
		shared actual Integer priority => 1;
		shared actual Boolean match({Anything*} input, ClassOrInterface<List<>> outputType) {
			return outputType.subtypeOf(`ListMutator<Nothing>`);
		}
	};
}
