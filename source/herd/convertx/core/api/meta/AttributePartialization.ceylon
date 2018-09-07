
import ceylon.language.meta.model {
	Attribute
}
import ceylon.collection {
	HashMap
}

shared class AttributePartialization({<Attribute<>->Anything>*} entries) satisfies Partialization{
	shared actual Map<Attribute<>,Anything> parts=HashMap<Attribute<>,Anything>{entries=entries;};
	
}