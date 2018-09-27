import test.base.herd.convertx.integration {
	IntegrationTest
}
import herd.convertx.api.provision {
	Provider
}

import herd.convertx.core.provisioning {
	CoreProvider
}
import herd.convertx.json.provisioning {
	JsonProvider
}
import ceylon.logging {
	info,
	Priority
}
import herd.convertx.core.operation {
	DefaultContext
}
import herd.convertx.api {
	Convertx
}
import herd.convertx.core.configuration {
	Logging
}

shared class JsonIntegration extends IntegrationTest {
	
	shared new (Provider[] providers = [], Priority loggingPrio = info)
			extends IntegrationTest([CoreProvider(),
			JsonProvider(), *providers], [Logging(loggingPrio, `module herd.convertx.core`),
			Logging(loggingPrio, `module herd.convertx.json`)]) {}
	
	shared actual Convertx convertx => Convertx(DefaultContext { providers = providers; });
}
