import herd.gecon.core.engine {
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
					`module herd.gecon.json.transformer`,
					`module herd.gecon.core.transformer`,
					`module herd.gecon.collection.transformer`
				];
			};
		};
	};
}
