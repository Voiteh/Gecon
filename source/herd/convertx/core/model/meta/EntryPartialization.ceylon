import herd.convertx.core.api.meta {
	Partialization
}
import ceylon.collection {
	HashMap
}
shared class EntryPartialization(parts) satisfies Partialization {
	shared actual HashMap<String,Anything> parts;
	
}