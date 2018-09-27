
import ceylon.json {
	JsonObject
}
import herd.codamo.api.meta.component {
	AttributePartializer
}

import herd.codamo.api.operation {
	wired
}
shared wired class JsonObjectToAttributePartializator() extends AttributePartializer<JsonObject, Object>() {
	shared actual String[] extractKeys(JsonObject source) => source.keys.sequence();
	
	shared actual Anything extractValue(JsonObject source, String key) => source.get(key);
	
}