import test.codamo.base.integration {
	IntegrationTest
}
import herd.codamo.core.provisioning {
	CoreProvider
}
import herd.codamo.core.configuration {
	Logging
}
import ceylon.logging {
	info,
	Priority
}
import herd.codamo.api {
	Codamo
}
import herd.codamo.core.operation {
	DefaultContext
}
import herd.codamo.api.provision {
	Provider
}

shared class CoreIntegration extends IntegrationTest {
	
	shared new (Provider[] providers=[], Priority loggingPrio = info) 
			extends IntegrationTest([CoreProvider(),*providers], [Logging(loggingPrio, `module herd.codamo.core`)]) {}
	
	shared actual Codamo convertx => Codamo(DefaultContext { providers = providers; });
}
