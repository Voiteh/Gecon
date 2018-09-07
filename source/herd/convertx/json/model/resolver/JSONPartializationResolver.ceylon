import herd.convertx.core.api.meta {
	Partialization,
	Relation
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
	ClassOrInterface
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.json.model.meta {
	JSONPartialization
}
wired
shared class JSONPartializationResolver() satisfies Resolver<Partialization,Relation<Object, JSONObject>>{
	shared actual Class<Partialization,Nothing> resolve(Context context, Relation<Object, JSONObject> input, ClassOrInterface<Partialization> outputType) => `JSONPartialization`;
	
	
	matcher => object satisfies JSONPartializationResolver.Matcher{
		shared actual Boolean match(Relation<Object, JSONObject> input, ClassOrInterface<Partialization> outputType) => true;
		
		shared actual Integer priority => 2;
		
		
	};
	
	
	
}