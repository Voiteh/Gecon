
import ceylon.json {
	JsonObject
}
import herd.codamo.api.meta.component {
	AttributesMapper
}

import herd.codamo.api.operation {
	wired
}

"Creates [[herd.codamo.api.meta::AttributesMapping]] form [[JsonObject]] keys to object attributes. Names of key to attribute must matche exactly to create mapping"
by("Wojciech Potiopa")
shared wired class JsonObjectToAttributeMapper() extends AttributesMapper<JsonObject, Object>() {
	shared actual String[] extractSourcePartsKey(JsonObject source) => source.keys.sequence();
	
	shared actual Anything extractSourcePartValue(JsonObject source, String key) => source.get(key);
	
}