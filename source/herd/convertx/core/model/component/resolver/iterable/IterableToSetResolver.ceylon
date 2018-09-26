import ceylon.language.meta.model {
	Class,
	Interface,
	Type
}
import ceylon.collection {
	HashSet
}
import herd.convertx.api {
	Context,
	Resolver,
	wired
}
import herd.convertx.api.operation {
	Resolvance
}

shared wired class IterableToSetResolver() satisfies Resolver<{Anything*},Set<>>{
	
	shared actual Class<Set<>> resolve(Context context,{Anything*} input,Type<Set<>> outputType) { 
		assert(is Interface<Set<>> outputType);
		value typeForIterable = iterableTypeArgument(outputType);
		return `class HashSet`.classApply<Set<>>(typeForIterable);
	}		
	
	shared actual Resolvance<{Anything*},Set<Object>,Type<Set<Object>>>.Matcher? matcher => object satisfies Resolvance<{Anything*},Set<Object>,Type<Set<Object>>>.Matcher{
		shared actual Integer priority => 1;
		shared actual Boolean match({Anything*} input, Type<Set<>> outputType) => outputType is Interface<Set<>>;
	};
	
}

