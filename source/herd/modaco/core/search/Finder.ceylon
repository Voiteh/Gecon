


import herd.modaco.core.registration {
	Container
}
import herd.modaco.core.operation {
	Executable
}
import herd.modaco.api.operation {
	ComponentFindingException
}

shared interface  Finder {
	
	throws(`class ComponentFindingException`)
	shared formal Executable find(Container container, [Anything*] args);
	
	
}