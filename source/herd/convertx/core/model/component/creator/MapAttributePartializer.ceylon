import herd.convertx.core.api.component {
	wired
}

import herd.convertx.core.api.component.support.meta {
	AttributePartializer
}
import herd.convertx.core.api.meta.support {
	AttributePartialization
}
import ceylon.language.meta.model {
	ClassOrInterface,
	Class
}
wired
shared class MapAttributePartializer() extends AttributePartializer<Map<String,Anything>,Object>(){
	shared actual String[] extractKeys(Map<String,Anything> source) => source.keys.sequence();
	
	shared actual Anything extractValue(Map<String,Anything> source, String key) => source.get(key);
	
	matcher => object satisfies MapAttributePartializer.Matcher{
		
		shared actual Integer priority => 1;
		shared actual Boolean match(Class<AttributePartialization,Nothing> kind, Map<String,Anything>->ClassOrInterface<Object> arguments) => nothing;
		
		
		
		
	};
}