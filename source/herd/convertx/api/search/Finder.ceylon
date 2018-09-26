
import herd.convertx.api.registration {
	Executable,
	Container
}
import herd.convertx.api {
	ComponentFindingException
}

shared interface  Finder {
	
	throws(`class ComponentFindingException`)
	shared formal Executable find(Container container, [Anything*] args);
	
	
}