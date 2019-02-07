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



testExtension(`class LoggingTestExtension`)
shared class CoreIntegration() {
	
	shared default Codamo codamo => Codamo{ 
		provider = AutoProvider{ 
			transformations = ScopeProvisioning([`module herd.codamo.transformer.core`]);
			
		};

	};
}
