import ceylon.language.meta.model {
	Class
}
import herd.modaco.api.meta {
	Relation,
	AttributePartialization
}
import herd.modaco.api.meta.component {
	AttributePartializer
}

import herd.modaco.api.operation {
	Creation,
	wired
}

shared wired
class MapAttributePartializer() extends AttributePartializer<Map<String,Anything>,Object>() {
	shared actual String[] extractKeys(Map<String,Anything> source) => source.keys.sequence();
	
	shared actual Anything extractValue(Map<String,Anything> source, String key) => source.get(key);
	
	shared actual Creation<Relation<Map<String,Anything>,Object>,AttributePartialization,AttributePartialization>.Matcher? matcher => object satisfies Creation<Relation<Map<String,Anything>,Object>,AttributePartialization,AttributePartialization>.Matcher {
		shared actual Integer priority => 1;
		shared actual Boolean match(Class<AttributePartialization,Nothing> kind, Relation<Map<String,Anything>,Object> arguments) => true;
	};
}
