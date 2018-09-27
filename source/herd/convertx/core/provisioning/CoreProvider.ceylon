
import herd.convertx.api.operation {
	Operation
}
import herd.convertx.api.configuration {
	Configuration
}
import herd.convertx.api.provision {
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
