import herd.codamo.api.core.configuration {
	Configuration
}

import herd.codamo.api.core.transformer {
	Transformation
}

"Provides definitions of [[Transformation]]s and [[Configuration]]s. Although strictly not used in module,
 this interface provides API definition for other modules"
shared interface Provider {
	"Provides [[Transformation]]s for further usage by framework"
	shared formal {Transformation*} operations;
	"Provides [[Configuration]]s to be used by [[Transformation]]s and other framework related classes"
	shared formal {Configuration*} configurations;
}
