import herd.convertx.api.component {
	ComponentFindingException
}
import herd.convertx.api.registration {
	Executable,
	Container
}

shared interface  Finder {
	
	throws(`class ComponentFindingException`)
	shared formal Executable find(Container container, [Anything*] args);
	
	
}