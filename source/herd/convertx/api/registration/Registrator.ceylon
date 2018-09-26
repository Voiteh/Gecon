import herd.convertx.api.operation {
	Operation
}

shared interface Registrator {
	
	shared formal void register(Visitor visitor,Registry registry,Operation[] operations);
	
}