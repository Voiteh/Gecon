

import herd.codamo.api.core.configuration {
	Configuration
}
import herd.codamo.api.core.provision {
	AutoProvider,
	provideOperations,
	Provider
}
import ceylon.collection {
	MutableList,
	ArrayList
}
import herd.codamo.api.core.transformer {
	Transformation
}

"Provider [[Transformation]]s for [[herd.codamo.core module]], It is mutable [[Provider]]. 
 If there is need, to add or remove, [[Transformation]] from [[Provider]], it can be done by accesing [[operations]] collection
 [[Configuration]]s must be added manually. This [[Provider]] can be used for provisioning of user modules [[Transformation]]s."
by("Wojciech Potiopa")
shared class CoreProvider() extends AutoProvider(`module`,{}) { 
	"Operations which will be provided can be manipulated using this collection"
	shared actual MutableList<Transformation> operations=ArrayList<Transformation>{elements=provideOperations(`module`);};
	
	"Configurations which will be provide can be manipulted using this colleciton"
	shared actual MutableList<Configuration> configurations=ArrayList<Configuration>();
}
