import ceylon.logging {
	info
}
import ceylon.test {
	testExtension
}

import herd.codamo.engine {
	Codamo,
	AutoProvider,
	ScopeProvisioning
}
import herd.codamo.engine.configuration {
	Configuration,
	Logging
}

import test.codamo.extension {
	LoggingTestExtension
}
testExtension(`class LoggingTestExtension`)
shared class CollectionIntegration() {
	
	shared default Codamo codamo => Codamo { 
		provider = AutoProvider{ 
			transformations = ScopeProvisioning{
				scopes=[`module herd.codamo.transformer.core`,`module herd.codamo.transformer.collection`];
			};
		 };
		configuration = Configuration{
			logging = Logging(info);
		};
	
	};
	
	
}