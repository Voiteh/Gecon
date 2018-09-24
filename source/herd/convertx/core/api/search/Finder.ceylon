import herd.convertx.core.api.component {
	ComponentFindingException
}
import herd.convertx.core.api.registration {
	Executable,
	Container
}

shared interface  Finder {
	
	throws(`class ComponentFindingException`)
	shared formal Executable find(Container container, [Anything*] args);
	
	
}