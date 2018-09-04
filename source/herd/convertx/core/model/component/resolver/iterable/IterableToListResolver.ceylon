import ceylon.collection {
	ArrayList
}
import ceylon.language.meta.model {
	Class,
	Interface
}
import herd.convertx.core.api.component {
	Component,
	TypedResolver,
	wired
}
import herd.convertx.core.api {
	Context
}

wired
shared class IterableToListResolver() satisfies TypedResolver<List<>,Interface<List<>>,{Anything*}> {
	shared actual Class<List<>,Nothing> resolve(Context context,{Anything*} input, Interface<List<>> outputType) {
		value typeForIterable = iterableTypeArgument(outputType);
		
		return `class ArrayList`.classApply<List<>>(typeForIterable);
	}
	
	matcher => object satisfies IterableToListResolver.Matcher {
		
		shared actual Integer priority => 1;
		shared actual Boolean match({Anything*} input, Interface<List<>> outputType) => true;
	};
}
