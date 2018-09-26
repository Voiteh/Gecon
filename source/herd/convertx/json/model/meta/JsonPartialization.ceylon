import herd.convertx.api.meta {
	Partialization
}
import ceylon.collection {
	HashMap
}
import ceylon.json {
	Value
}
shared class JsonPartialization({<String->Value>*} entries) satisfies Partialization{
	shared actual Map<String,Value> parts = HashMap<String,Value>{entries=entries;};
	
}