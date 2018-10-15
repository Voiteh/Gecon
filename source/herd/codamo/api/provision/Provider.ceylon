import herd.codamo.api.configuration {
	Configuration
}
import herd.codamo.api.operation {
	Operation
}

"Provides definitions of [[Operation]]s and [[Configuration]]s. Although strictly not used in [[module herd.codamo.api]],
 this interface provides API definition for other modules"
shared interface Provider {
	"Provides [[Operation]]s for further usage by framework"
	shared formal {Operation*} operations;
	"Provides [[Configuration]]s to be used by [[Operation]]s and other framework related classes"
	shared formal {Configuration*} configurations;
}
