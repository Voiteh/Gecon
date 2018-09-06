
import ceylon.language.meta.model {
	Attribute
}

shared class AttributePartialization(parts) satisfies Partialization{
	shared actual Map<Attribute<>,Anything> parts;
	
}