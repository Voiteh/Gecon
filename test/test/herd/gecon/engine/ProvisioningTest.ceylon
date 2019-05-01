import ceylon.test {
	test,
	testExtension
}
import herd.gecon.engine {
	AutoProvider,
	ScopeProvisioning,
	Codamo
}
import herd.gecon.test.extension {
	LoggingTestExtension
}
import herd.gecon.engine.configuration {
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
		value codamo = Codamo {
			 provider = AutoProvider {
				transformations = ScopeProvisioning([`module test.gecon.transformer`]);
			};
			configuration = Configuration {
				logging = Logging(debug);
			};
		};
		value convert = codamo.convert("String", `Null`);
		assert (is Null convert);
	}
}
