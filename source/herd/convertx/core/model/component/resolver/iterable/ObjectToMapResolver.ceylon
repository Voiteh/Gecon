import herd.convertx.core.api.component {
	Resolver,
	wired
}
import ceylon.language.meta.model {
	Class,
	Type
}
import herd.convertx.core.api {
	Context
}
import ceylon.collection {
	HashMap
}

shared wired class ObjectToMapResolver() satisfies Resolver<Object,Map<String,Anything>>{
	shared actual Class<Map<String,Anything>,Nothing> resolve(Context context, Object type, Type<Map<String,Anything>> outputType) => `HashMap<String,Anything>`;
	
	matcher => object satisfies ObjectToMapResolver.Matcher{
		shared actual Boolean match(Object input, Type<Map<String,Anything>> outputType) => true;
		
		shared actual Integer priority => 0;
		
	};
	
}