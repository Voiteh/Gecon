import herd.convertx.core.api.component.support.meta {
	AttributePartializer
}
import herd.convertx.core.api.component {
	Component
}
import herd.convertx.json {
	JSONObject
}
service(`interface Component`)
shared class JSONObjectToAttributePartializator() extends AttributePartializer<JSONObject, Object>() {
	shared actual String[] extractKeys(JSONObject source) => source.keys.sequence();
	
	shared actual Anything extractValue(JSONObject source, String key) => source.get(key);
	
}