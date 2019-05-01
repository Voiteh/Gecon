import herd.gecon.engine {
	Codamo,
	AutoProvider,
	ScopeProvisioning
}
import ceylon.test {
	testExtension
}
import herd.gecon.test.extension {
	LoggingTestExtension
}



testExtension(`class LoggingTestExtension`)
shared class CoreIntegration() {
	
	shared default Codamo codamo => Codamo{ 
		provider = AutoProvider{ 
			transformations = ScopeProvisioning([`module herd.gecon.transformer.core`]);
			
		};

	};
}
