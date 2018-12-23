
import ceylon.json {
	JsonObject
}
import herd.codamo.api.core.meta.component {
	AttributesMapper
}


import herd.codamo.api.core.transformer {
	provided
}

"Creates [[herd.codamo.api.core.meta::AttributesMapping]] form [[JsonObject]] keys to object attributes. Names of key to attribute must matche exactly to create mapping"
by("Wojciech Potiopa")
shared provided class JsonObjectToAttributeMapper() extends AttributesMapper<JsonObject, Object>() {
	shared actual String[] extractSourcePartsKey(JsonObject source) => source.keys.sequence();
	
	shared actual Anything extractSourcePartValue(JsonObject source, String key) => source.get(key);
	
}