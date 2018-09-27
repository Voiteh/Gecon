
import herd.modaco.api.provision {
	WireingProvider,
	provideOperations
}
import ceylon.collection {
	ArrayList,
	MutableList
}
import herd.modaco.api.operation {
	Operation
}
import herd.modaco.api.configuration {
	Configuration
}
shared class JsonProvider() extends WireingProvider(`module`,{}) { 
	shared actual MutableList<Operation> operations=ArrayList<Operation>{elements=provideOperations(`module`);};
	shared actual MutableList<Configuration> configurations=ArrayList<Configuration>();
}