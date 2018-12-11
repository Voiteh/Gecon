import test.codamo.base.integration {
	IntegrationTest
}
import herd.codamo.engine.provisioning {
	CoreProvider
}
import herd.codamo.engine.configuration {
	LoggingConfiguration
}
import ceylon.logging {
	info,
	Priority
}
import herd.codamo.api.core {
	Codamo
}
import herd.codamo.engine.transformation {
	DefaultDelegator
}
import herd.codamo.api.core.provision {
	Provider
}

shared class CoreIntegration extends IntegrationTest {
	
	shared new (Provider[] providers=[], Priority loggingPrio = info) 
			extends IntegrationTest([CoreProvider(),*providers], [LoggingConfiguration(loggingPrio, `module herd.codamo.engine`)]) {}
	
	shared actual Codamo convertx => Codamo(DefaultDelegator { providers = providers; });
}
