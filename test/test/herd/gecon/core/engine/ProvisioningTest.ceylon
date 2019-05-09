import ceylon.test {
	test,
	testExtension
}
import herd.gecon.core.engine {
	AutoProvider,
	ScopeProvisioning,
	Gecon
}
import herd.gecon.test.extension {
	LoggingTestExtension
}
import herd.gecon.core.engine.configuration {
	Configuration,
	Logging
}
import ceylon.logging {
	debug
}

testExtension (`class LoggingTestExtension`)
shared class ProvisioningTest() {
	
	shared test
	void shouldProvideAllTranformersFromTestModule() {
		value gecon = Gecon {
			 provider = AutoProvider {
				transformations = ScopeProvisioning([`module test.gecon.transformer`]);
			};
			configuration = Configuration {
				logging = Logging(debug);
			};
		};
		value convert = gecon.transform("String", `Null`);
		assert (is Null convert);
	}
}
