import ceylon.language.meta.model {
	Class,
	Interface
}
import ceylon.collection {
	HashSet
}
import herd.convertx.core.api.component {
	TypedResolver,
	wired
}
import herd.convertx.core.api {
	Context
}
wired
shared class IterableToSetResolver() satisfies TypedResolver<Set<>,Interface<Set<>>,{Anything*}>{
	
	shared actual Class<Set<>> resolve(Context context,{Anything*} input,Interface<Set<>> outputType) { 
		value typeForIterable = iterableTypeArgument(outputType);
		return `class HashSet`.classApply<Set<>>(typeForIterable);
	}		
	
	matcher => object satisfies IterableToSetResolver.Matcher{
		shared actual Integer priority => 1;
		shared actual Boolean match({Anything*} input, Interface<Set<Object>> outputType) => true;
		
		
		
		
	};
	
	
	
}