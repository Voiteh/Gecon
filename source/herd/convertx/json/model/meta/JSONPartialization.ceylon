import herd.convertx.core.api.meta {
	Partialization
}
import ceylon.collection {
	HashMap
}
import herd.convertx.json {
	JSONValue
}
shared class JSONPartialization({<String->JSONValue>*} entries) satisfies Partialization{
	shared actual Map<String,JSONValue> parts = HashMap<String,JSONValue>{entries=entries;};
	
}