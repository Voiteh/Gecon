import ceylon.logging {
	info
}
import ceylon.test {
	testExtension
}

import herd.gecon.engine {
	Codamo,
	AutoProvider,
	ScopeProvisioning
}
import herd.gecon.engine.configuration {
	Configuration,
	Logging
}

import herd.gecon.test.extension {
	LoggingTestExtension
}
testExtension(`class LoggingTestExtension`)
shared class CollectionIntegration() {
	
	shared default Codamo codamo => Codamo { 
		provider = AutoProvider{ 
			transformations = ScopeProvisioning{
				scopes=[`module herd.gecon.transformer.core`,`module herd.gecon.transformer.collection`];
			};
		 };
		configuration = Configuration{
			logging = Logging(info);
		};
	
	};
	
	
}