import herd.convertx.core.api.component {
	wired
}

import herd.convertx.core.api.component.support.meta {
	AttributePartializer
}

import ceylon.language.meta.model {
	Class
}
import herd.convertx.core.api.meta {
	Relation,
	AttributePartialization
}

wired
shared class MapAttributePartializer() extends AttributePartializer<Map<String,Anything>,Object>(){
	shared actual String[] extractKeys(Map<String,Anything> source) => source.keys.sequence();
	
	shared actual Anything extractValue(Map<String,Anything> source, String key) => source.get(key);
	
	matcher => object satisfies MapAttributePartializer.Matcher{
		
		shared actual Integer priority => 1;
		shared actual Boolean match(Class<AttributePartialization,Nothing> kind, Relation<Map<String,Anything>,Object> arguments) => true;
		
		
		
		
		
	};
}