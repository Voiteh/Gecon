import herd.codamo.api.operation {
	Operation
}

shared interface Registrator {
	
	shared formal void register(Operation.Flatter visitor,Registry registry,Operation[] operations);
	
}