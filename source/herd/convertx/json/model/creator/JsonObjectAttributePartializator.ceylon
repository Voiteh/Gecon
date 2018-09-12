import herd.convertx.core.api.component.support.meta {
	AttributePartializer
}
import herd.convertx.core.api.component {
	wired
}
import herd.convertx.json {
	JSONObject
}
shared wired class JsonObjectToAttributePartializator() extends AttributePartializer<JSONObject, Object>() {
	shared actual String[] extractKeys(JSONObject source) => source.keys.sequence();
	
	shared actual Anything extractValue(JSONObject source, String key) => source.get(key);
	
}