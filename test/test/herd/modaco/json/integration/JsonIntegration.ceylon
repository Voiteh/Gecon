import test.modaco.base.integration {
	IntegrationTest
}
import herd.modaco.api.provision {
	Provider
}

import herd.modaco.core.provisioning {
	CoreProvider
}
import herd.modaco.json.provisioning {
	JsonProvider
}
import ceylon.logging {
	info,
	Priority
}
import herd.modaco.core.operation {
	DefaultContext
}
import herd.modaco.api {
	Convertx
}
import herd.modaco.core.configuration {
	Logging
}

shared class JsonIntegration extends IntegrationTest {
	
	shared new (Provider[] providers = [], Priority loggingPrio = info)
			extends IntegrationTest([CoreProvider(),
			JsonProvider(), *providers], [Logging(loggingPrio, `module herd.modaco.core`),
			Logging(loggingPrio, `module herd.modaco.json`)]) {}
	
	shared actual Convertx convertx => Convertx(DefaultContext { providers = providers; });
}
