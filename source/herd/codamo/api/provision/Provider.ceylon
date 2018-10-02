import herd.codamo.api.configuration {
	Configuration
}
import herd.codamo.api.operation {
	Operation
}

"Provides definitions of [[Operation]]s and [[Configuration]]s. Although strictly not used in [[module herd.codamo.api]],
 this interface provides API definition for other modules"
shared interface Provider {
	shared formal {Operation*} operations;
	shared formal {Configuration*} configurations;
}
