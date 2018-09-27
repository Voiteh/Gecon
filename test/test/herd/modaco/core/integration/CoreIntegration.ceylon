import test.modaco.base.integration {
	IntegrationTest
}
import herd.modaco.core.provisioning {
	CoreProvider
}
import herd.modaco.core.configuration {
	Logging
}
import ceylon.logging {
	info,
	Priority
}
import herd.modaco.api {
	Convertx
}
import herd.modaco.core.operation {
	DefaultContext
}
import herd.modaco.api.provision {
	Provider
}

shared class CoreIntegration extends IntegrationTest {
	
	shared new (Provider[] providers=[], Priority loggingPrio = info) 
			extends IntegrationTest([CoreProvider(),*providers], [Logging(loggingPrio, `module herd.modaco.core`)]) {}
	
	shared actual Convertx convertx => Convertx(DefaultContext { providers = providers; });
}
