
import ceylon.language.meta.model {
	Attribute
}

"Holder for mappings between apptributes"
by("Wojciech Potiopa")
shared class AttributesMapping(
	"Mappings between attributes. Mostly usefull for different types mapping"
	shared actual {<Attribute<>->Anything>*} mappings
) satisfies Mapping{}