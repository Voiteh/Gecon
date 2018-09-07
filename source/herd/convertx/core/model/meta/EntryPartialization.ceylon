import herd.convertx.core.api.meta {
	Partialization
}
import ceylon.collection {
	HashMap
}
shared class EntryPartialization({<String->Anything>*} entries) satisfies Partialization {
	shared actual HashMap<String,Anything> parts=HashMap<String,Anything>{entries=entries;};
	
}