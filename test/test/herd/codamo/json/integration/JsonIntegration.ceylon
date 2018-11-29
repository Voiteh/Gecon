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
	DefaultDelegator
}
import herd.codamo.api {
	Codamo
}
import herd.codamo.core.configuration {
	LoggingConfiguration
}

shared class JsonIntegration extends IntegrationTest {
	
	shared new (Provider[] providers = [], Priority loggingPrio = info)
			extends IntegrationTest([CoreProvider(),
			JsonProvider(), *providers], [LoggingConfiguration(loggingPrio, `module herd.codamo.core`),
			LoggingConfiguration(loggingPrio, `module herd.codamo.json`)]) {}
	
	shared actual Codamo convertx => Codamo(DefaultDelegator { providers = providers; });
}
