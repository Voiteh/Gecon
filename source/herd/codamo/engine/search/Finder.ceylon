


import herd.codamo.engine.registration {
	Container
}
import herd.codamo.engine.transformation {
	Executable
}

import herd.codamo.api.core.transformer {
	ComponentFindingError
}

"Finder interface"
shared interface  Finder {
	"Finds an [[Executable]] for provided [[args]] or throws [[ComponentFindingError]]"
	throws(`class ComponentFindingError`)
	shared formal Executable find(
		"Container in which search is executed"
		Container container,
		"Arguments for searching" 
		[Anything*] args);
	
	
}