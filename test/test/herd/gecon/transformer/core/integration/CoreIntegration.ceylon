import herd.gecon.core.engine {
	AutoProvider,
	ScopeProvisioning,
	Gecon
}
import ceylon.test {
	testExtension
}
import herd.gecon.test.extension {
	LoggingTestExtension
}



testExtension(`class LoggingTestExtension`)
shared class CoreIntegration() {
	
	shared default Gecon gecon => Gecon{ 
		provider = AutoProvider{ 
			transformations = ScopeProvisioning([`module herd.gecon.core.transformer`]);
			
		};

	};
}
