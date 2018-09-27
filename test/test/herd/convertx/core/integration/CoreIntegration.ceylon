import test.base.herd.convertx.integration {
	IntegrationTest
}
import herd.convertx.core.provisioning {
	CoreProvider
}
import herd.convertx.core.configuration {
	Logging
}
import ceylon.logging {
	info,
	Priority
}
import herd.convertx.api {
	Convertx
}
import herd.convertx.core.operation {
	DefaultContext
}
import herd.convertx.api.provision {
	Provider
}

shared class CoreIntegration extends IntegrationTest {
	
	shared new (Provider[] providers=[], Priority loggingPrio = info) 
			extends IntegrationTest([CoreProvider(),*providers], [Logging(loggingPrio, `module herd.convertx.core`)]) {}
	
	shared actual Convertx convertx => Convertx(DefaultContext { providers = providers; });
}
