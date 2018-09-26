import herd.convertx.api.meta {
	Partialization,
	Relation
}

import ceylon.language.meta.model {
	Class,
	Type
}
import herd.convertx.api {
	Context,
	Resolver,
	wired
}
import herd.convertx.json.model.meta {
	JsonPartialization
}
import ceylon.json {
	JsonObject
}
wired
shared class JsonPartializationResolver() satisfies Resolver<Relation<Object, JsonObject>,Partialization>{
	shared actual Class<Partialization,Nothing> resolve(Context context, Relation<Object, JsonObject> input, Type<Partialization> outputType) => `JsonPartialization`;
	
	
	matcher => object satisfies JsonPartializationResolver.Matcher{
		shared actual Boolean match(Relation<Object, JsonObject> input, Type<Partialization> outputType) => true;
		
		shared actual Integer priority => 2;
		
		
	};
	
	
	
}