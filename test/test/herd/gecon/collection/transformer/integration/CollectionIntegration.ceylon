import ceylon.logging {
	info
}
import ceylon.test {
	testExtension
}

import herd.gecon.core.engine {
	Codamo,
	AutoProvider,
	ScopeProvisioning
}
import herd.gecon.core.engine.configuration {
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
				scopes=[`module herd.gecon.core.transformer`,`module herd.gecon.collection.transformer`];
			};
		 };
		configuration = Configuration{
			logging = Logging(info);
		};
	
	};
	
	
}