
import ceylon.json {
	JsonObject
}
import herd.convertx.api.meta.component {
	AttributePartializer
}

import herd.convertx.api.operation {
	wired
}
shared wired class JsonObjectToAttributePartializator() extends AttributePartializer<JsonObject, Object>() {
	shared actual String[] extractKeys(JsonObject source) => source.keys.sequence();
	
	shared actual Anything extractValue(JsonObject source, String key) => source.get(key);
	
}