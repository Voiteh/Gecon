import ceylon.language.meta.model {
	Attribute
}
"Holder for mappings between apptributes and any other types"
by("Wojciech Potiopa")
shared class AttributeDictionary({<Attribute<>->Anything>*} stream) extends Dictionary<Attribute<>, Anything>(stream){}