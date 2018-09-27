
import herd.convertx.api {
	ComponentFindingException
}

import herd.convertx.api.flattening {
	Executable
}
import herd.convertx.core.registration {
	Container
}

shared interface  Finder {
	
	throws(`class ComponentFindingException`)
	shared formal Executable find(Container container, [Anything*] args);
	
	
}