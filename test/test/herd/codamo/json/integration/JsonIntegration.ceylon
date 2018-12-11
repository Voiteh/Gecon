import test.codamo.base.integration {
	IntegrationTest
}
import herd.codamo.api.core.provision {
	Provider
}

import herd.codamo.engine.provisioning {
	CoreProvider
}
import herd.codamo.transformer.json.provisioning {
	JsonProvider
}
import ceylon.logging {
	info,
	Priority
}
import herd.codamo.engine.transformation {
	DefaultDelegator
}
import herd.codamo.api.core {
	Codamo
}
import herd.codamo.engine.configuration {
	LoggingConfiguration
}

shared class JsonIntegration extends IntegrationTest {
	
	shared new (Provider[] providers = [], Priority loggingPrio = info)
			extends IntegrationTest([CoreProvider(),
			JsonProvider(), *providers], [LoggingConfiguration(loggingPrio, `module herd.codamo.engine`),
			LoggingConfiguration(loggingPrio, `module herd.codamo.transformer.json`)]) {}
	
	shared actual Codamo convertx => Codamo(DefaultDelegator { providers = providers; });
}
