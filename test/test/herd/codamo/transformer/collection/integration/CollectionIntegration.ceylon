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
shared class CollectionIntegration() {
	
	shared default Codamo codamo => Codamo { 
		provider = AutoProvider{ 
			transformations = ScopeProvisioning{
				scopes=[`module herd.codamo.transformer.core`,`module herd.codamo.transformer.collection`];
			};
		 };
		configuration = Configuration{
			logging = Logging(trace);
		};
	
	};
	
	
}