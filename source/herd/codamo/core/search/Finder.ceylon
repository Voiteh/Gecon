


import herd.codamo.core.registration {
	Container
}
import herd.codamo.core.operation {
	Executable
}
import herd.codamo.api.operation {
	ComponentFindingError
}

shared interface  Finder {
	
	throws(`class ComponentFindingError`)
	shared formal Executable find(Container container, [Anything*] args);
	
	
}