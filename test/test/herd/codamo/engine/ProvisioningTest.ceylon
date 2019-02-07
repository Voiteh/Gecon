import ceylon.test {
	test,
	testExtension
}
import herd.codamo.engine {
	AutoProvider,
	ScopeProvisioning,
	Codamo
}
import test.codamo.extension {
	LoggingTestExtension
}
import herd.codamo.engine.configuration {
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
				transformations = ScopeProvisioning([`module test.codamo.transformer`]);
			};
			configuration = Configuration {
				logging = Logging(debug);
			};
		};
		value convert = codamo.convert("String", `Null`);
		assert (is Null convert);
	}
}
