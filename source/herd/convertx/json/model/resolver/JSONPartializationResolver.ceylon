import herd.convertx.core.api.meta {
	Partialization
}
import herd.convertx.json {
	JSONObject
}
import herd.convertx.core.api.component {
	Resolver,
	wired
}
import ceylon.language.meta.model {
	Class,
	ClassOrInterface,
	Type
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.json.model.meta {
	JSONPartialization
}
wired
shared class JSONPartializationResolver() satisfies Resolver<Partialization,Object->Type<JSONObject>>{
	shared actual Class<Partialization,Nothing> resolve(Context context, Object->Type<JSONObject> type, ClassOrInterface<Partialization> outputType) => `JSONPartialization`;
	
	
	matcher => object satisfies JSONPartializationResolver.Matcher{
		shared actual Boolean match(Object->Type<JSONObject> input, ClassOrInterface<Partialization> outputType) => true;
		
		shared actual Integer priority => 2;
		
		
	};
	
	
	
}