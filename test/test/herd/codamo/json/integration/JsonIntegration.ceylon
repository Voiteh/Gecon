import test.codamo.base.integration {
	IntegrationTest
}
import herd.codamo.api.provision {
	Provider
}

import herd.codamo.core.provisioning {
	CoreProvider
}
import herd.codamo.json.provisioning {
	JsonProvider
}
import ceylon.logging {
	info,
	Priority
}
import herd.codamo.core.operation {
	DefaultContext
}
import herd.codamo.api {
	Codamo
}
import herd.codamo.core.configuration {
	Logging
}

shared class JsonIntegration extends IntegrationTest {
	
	shared new (Provider[] providers = [], Priority loggingPrio = info)
			extends IntegrationTest([CoreProvider(),
			JsonProvider(), *providers], [Logging(loggingPrio, `module herd.codamo.core`),
			Logging(loggingPrio, `module herd.codamo.json`)]) {}
	
	shared actual Codamo convertx => Codamo(DefaultContext { providers = providers; });
}