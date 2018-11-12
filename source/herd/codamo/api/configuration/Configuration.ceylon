import ceylon.language.meta.declaration {
	Package,
	Module
}
"A configuration class. It will be applied to all classes implementing [[Configurable]] interface for specific [[category]]"
by("Wojciech Potiopa")
shared interface Configuration {
	
	"Allows scoping application of [[Configuration]] for [[Package]] or [[Module]]"
	shared default Package|Module category => `module`;
	
}