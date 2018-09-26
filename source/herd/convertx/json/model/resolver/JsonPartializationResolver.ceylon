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
import herd.convertx.api.operation {
	Resolvance
}
wired
shared class JsonPartializationResolver() satisfies Resolver<Relation<Object, JsonObject>,Partialization>{
	shared actual Class<Partialization,Nothing> resolve(Context context, Relation<Object, JsonObject> input, Type<Partialization> outputType) => `JsonPartialization`;
	
	
	shared actual Resolvance<Relation<Object,JsonObject>,Partialization,Type<Partialization>>.Matcher? matcher => object satisfies Resolvance<Relation<Object,JsonObject>,Partialization,Type<Partialization>>.Matcher{
		shared actual Boolean match(Relation<Object, JsonObject> input, Type<Partialization> outputType) => true;
		
		shared actual Integer priority => 2;
	};
	
	
}

