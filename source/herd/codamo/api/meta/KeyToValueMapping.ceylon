"Key to value mapping holder"
by("Wojciech Potiopa")
shared class KeyToValueMapping(
	"Key to value mappings"
	shared actual{<String->Anything>*} mappings
) satisfies Mapping {}