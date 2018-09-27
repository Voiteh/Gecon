
import ceylon.language.meta.model {
	Attribute
}


shared class AttributePartialization(shared actual {<Attribute<>->Anything>*} parts) satisfies Partialization{}