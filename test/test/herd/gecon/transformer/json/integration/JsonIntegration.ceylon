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

testExtension (`class LoggingTestExtension`)
shared class JsonIntegration() {
	
	shared default Codamo codamo => Codamo {
		provider = AutoProvider {
			transformations = ScopeProvisioning {
				scopes = [
					`module herd.gecon.transformer.json`,
					`module herd.gecon.transformer.core`,
					`module herd.gecon.transformer.collection`
				];
			};
		};
	};
}
