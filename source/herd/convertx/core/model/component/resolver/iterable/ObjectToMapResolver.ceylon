import herd.convertx.core.api.component {
	Resolver,
	Component
}
import ceylon.language.meta.model {
	Class,
	ClassOrInterface
}
import herd.convertx.core.api {
	Context
}
import ceylon.collection {
	HashMap
}
service(`interface Component`)
shared class ObjectToMapResolver() satisfies Resolver<Map<String,Anything>,Object>{
	shared actual Class<Map<String,Anything>,Nothing> resolve(Context context, Object type, ClassOrInterface<Map<String,Anything>> outputType) => `HashMap<String,Anything>`;
	
	matcher => object satisfies ObjectToMapResolver.Matcher{
		shared actual Boolean match(Object input, ClassOrInterface<Map<String,Anything>> outputType) => true;
		
		shared actual Integer priority => 0;
		
	};
	
}