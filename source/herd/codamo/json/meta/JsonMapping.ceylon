import herd.codamo.api.meta {
	Mapping
}
import ceylon.collection {
	HashMap
}
import ceylon.json {
	Value
}
shared class JsonMapping({<String->Value>*} entries) satisfies Mapping{
	shared actual Map<String,Value> mappings = HashMap<String,Value>{entries=entries;};
	
}