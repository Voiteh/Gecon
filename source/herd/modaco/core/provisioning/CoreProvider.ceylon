
import herd.modaco.api.operation {
	Operation
}
import herd.modaco.api.configuration {
	Configuration
}
import herd.modaco.api.provision {
	WireingProvider,
	provideOperations
}
import ceylon.collection {
	MutableList,
	ArrayList
}

shared class CoreProvider({Configuration*} initialConfigurations={}) extends WireingProvider(`module`,{}) { 
	shared actual MutableList<Operation> operations=ArrayList<Operation>{elements=provideOperations(`module`);};
	shared actual MutableList<Configuration> configurations=ArrayList<Configuration>{elements = initialConfigurations;};
}
