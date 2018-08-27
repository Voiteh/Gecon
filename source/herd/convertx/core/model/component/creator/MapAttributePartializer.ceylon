import herd.convertx.core.api.component {
	Component
}

import herd.convertx.core.api.component.support.meta {
	AttributePartializer
}
service(`interface Component`)
shared class MapAttributePartializer() extends AttributePartializer<Map<String,Anything>,Object>(){
	shared actual String[] extractKeys(Map<String,Anything> source) => source.keys.sequence();
	
	shared actual Anything extractValue(Map<String,Anything> source, String key) => source.get(key);
	
}