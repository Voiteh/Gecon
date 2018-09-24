import herd.convertx.core.api.component {
	Component
}

shared interface Registrator {
	
	shared formal void register(Visitor visitor,Registry registry,Component[] components);
	
}