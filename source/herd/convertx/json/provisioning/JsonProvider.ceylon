
import herd.convertx.api.provision {
	WireingProvider,
	provideOperations
}
import ceylon.collection {
	ArrayList,
	MutableList
}
import herd.convertx.api.operation {
	Operation
}
import herd.convertx.api.configuration {
	Configuration
}
shared class JsonProvider() extends WireingProvider(`module`,{}) { 
	shared actual MutableList<Operation> operations=ArrayList<Operation>{elements=provideOperations(`module`);};
	shared actual MutableList<Configuration> configurations=ArrayList<Configuration>();
}