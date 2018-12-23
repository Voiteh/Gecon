import herd.codamo.api.core.meta {
	Mapping
}
import ceylon.collection {
	HashMap
}
import ceylon.json {
	Value
}

"Mapping for json related objects. Maps specific key to json value"
by("Wojciech Potiopa")
shared class JsonMapping({<String->Value>*} entries) satisfies Mapping{
	shared actual Map<String,Value> mappings = HashMap<String,Value>{entries=entries;};
	
}