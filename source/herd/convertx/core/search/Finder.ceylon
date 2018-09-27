


import herd.convertx.core.registration {
	Container
}
import herd.convertx.core.operation {
	Executable
}
import herd.convertx.api.operation {
	ComponentFindingException
}

shared interface  Finder {
	
	throws(`class ComponentFindingException`)
	shared formal Executable find(Container container, [Anything*] args);
	
	
}