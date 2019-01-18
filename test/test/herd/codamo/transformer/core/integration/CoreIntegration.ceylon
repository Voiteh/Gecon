import herd.codamo.engine {
	Codamo,
	AutoProvider,
	ScopeProvisioning
}
import ceylon.test {
	testExtension
}
import test.codamo.extension {
	LoggingTestExtension
}
import herd.codamo.engine.configuration {
	Configuration,
	Logging
}
import ceylon.logging {
	trace
}


testExtension(`class LoggingTestExtension`)
shared class CoreIntegration() {
	
	shared default Codamo codamo => Codamo{ 
		provider = AutoProvider{ 
			transformations = ScopeProvisioning([`module herd.codamo.transformer.core`]);
			
		};

	};
}
