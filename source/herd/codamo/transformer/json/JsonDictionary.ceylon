import ceylon.json {
	JsonObject
}
import herd.codamo.api.core.dictionary {
	Dictionary
}
shared class JsonDictionary({<String->JsonObject>*} entries) extends Dictionary<String,JsonObject>(entries){}