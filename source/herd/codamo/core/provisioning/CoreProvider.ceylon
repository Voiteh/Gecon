
import herd.codamo.api.operation {
	Operation
}
import herd.codamo.api.configuration {
	Configuration
}
import herd.codamo.api.provision {
	WireingProvider,
	provideOperations,
	Provider
}
import ceylon.collection {
	MutableList,
	ArrayList
}

"Provider [[Operation]]s for [[herd.codamo.core module]], It is mutable [[Provider]]. 
 If there is need, to add or remove, [[Operation]] from [[Provider]], it can be done by accesing [[operations]] collection
 [[Configuration]]s must be added manually. This [[Provider]] can be used for provisioning of user modules [[Operation]]s."
by("Wojciech Potiopa")
shared class CoreProvider() extends WireingProvider(`module`,{}) { 
	shared actual MutableList<Operation> operations=ArrayList<Operation>{elements=provideOperations(`module`);};
	shared actual MutableList<Configuration> configurations=ArrayList<Configuration>();
}
