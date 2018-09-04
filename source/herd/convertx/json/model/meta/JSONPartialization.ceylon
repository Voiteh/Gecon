import herd.convertx.core.api.meta {
	Partialization
}
import ceylon.collection {
	HashMap
}
shared class JSONPartialization(<String->Anything>* entries) satisfies Partialization{
	shared actual Map<String,Anything> parts = HashMap<String,Anything>{entries=entries;};
	
}