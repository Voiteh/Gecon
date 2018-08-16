import ceylon.collection {
	ArrayList
}
import ceylon.language.meta.model {
	Class,
	ClassOrInterface,
	Interface
}
import herd.convertx.core.api.component {
	Component,
	Resolver,
	TypedResolver
}

service (`interface Component`)
shared class IterableToListResolver() satisfies TypedResolver<List<>,Interface<List<>>,{Anything*}> {
	shared actual Class<List<>,Nothing> resolve({Anything*} input, Interface<List<>> outputType) {
		value typeForIterable = iterableTypeArgument(outputType);
		
		return `class ArrayList`.classApply<List<>>(typeForIterable);
	}
	
	matcher => object satisfies IterableToListResolver.Matcher {
		
		shared actual Integer priority => 1;
		shared actual Boolean match({Anything*} input, Interface<List<>> outputType) => true;
	};
}
