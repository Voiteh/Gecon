import ceylon.language.meta.declaration {
	Package,
	Module
}
import herd.codamo.api.core {
	Scope
}
"A configuration class. It will be applied to all classes implementing [[Configurable]] interface for specific [[scope]]"
by("Wojciech Potiopa")
shared interface Configuration {
	
	"Allows scoping application of [[Configuration]] for [[Package]] or [[Module]]"
	shared default Scope scope => `module`;
	
}