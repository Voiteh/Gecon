import test.codamo.base.integration {
	IntegrationTest
}
import herd.codamo.core.provisioning {
	CoreProvider
}
import herd.codamo.core.configuration {
	LoggingConfiguration
}
import ceylon.logging {
	info,
	Priority
}
import herd.codamo.api {
	Codamo
}
import herd.codamo.core.operation {
	DefaultDelegator
}
import herd.codamo.api.provision {
	Provider
}

shared class CoreIntegration extends IntegrationTest {
	
	shared new (Provider[] providers=[], Priority loggingPrio = info) 
			extends IntegrationTest([CoreProvider(),*providers], [LoggingConfiguration(loggingPrio, `module herd.codamo.core`)]) {}
	
	shared actual Codamo convertx => Codamo(DefaultDelegator { providers = providers; });
}
