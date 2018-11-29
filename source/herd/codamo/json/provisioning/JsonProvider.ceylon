
import herd.codamo.api.provision {
	AutoProvider,
	provideOperations
}
import ceylon.collection {
	ArrayList,
	MutableList
}
import herd.codamo.api.operation {
	Operation
}
import herd.codamo.api.configuration {
	Configuration
}
"Provides all Json convertion related operations"
by("Wojciech Potiopa")
shared class JsonProvider() extends AutoProvider(`module`,{}) { 
	shared actual MutableList<Operation> operations=ArrayList<Operation>{elements=provideOperations(`module`);};
	shared actual MutableList<Configuration> configurations=ArrayList<Configuration>();
}