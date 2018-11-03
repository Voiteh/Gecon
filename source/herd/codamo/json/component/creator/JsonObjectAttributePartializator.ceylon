
import ceylon.json {
	JsonObject
}
import herd.codamo.api.meta.component {
	AttributesMapper
}

import herd.codamo.api.operation {
	wired
}
shared wired class JsonObjectToAttributeMapper() extends AttributesMapper<JsonObject, Object>() {
	shared actual String[] extractSourcePartsKey(JsonObject source) => source.keys.sequence();
	
	shared actual Anything extractSourcePartValue(JsonObject source, String key) => source.get(key);
	
}