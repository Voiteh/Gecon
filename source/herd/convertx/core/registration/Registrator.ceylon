import herd.convertx.api.operation {
	Operation
}
import herd.convertx.api.flattening {
	Visitor
}

shared interface Registrator {
	
	shared formal void register(Visitor visitor,Registry registry,Operation[] operations);
	
}