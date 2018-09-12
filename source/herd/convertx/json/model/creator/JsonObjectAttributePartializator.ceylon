import herd.convertx.core.api.component.support.meta {
	AttributePartializer
}
import herd.convertx.core.api.component {
	wired
}
import ceylon.json {
	JsonObject
}
shared wired class JsonObjectToAttributePartializator() extends AttributePartializer<JsonObject, Object>() {
	shared actual String[] extractKeys(JsonObject source) => source.keys.sequence();
	
	shared actual Anything extractValue(JsonObject source, String key) => source.get(key);
	
}