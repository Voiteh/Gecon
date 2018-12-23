import herd.codamo.api.core {
	Codamo
}
import ceylon.test {
	testExtension
}
import herd.codamo.api.core.configuration {
	Configuration
}
import herd.codamo.api.core.provision {
	Provider
}

import test.codamo.base {
	LoggingTestExtension
}

testExtension(`class LoggingTestExtension`)
shared abstract class IntegrationTest(
	shared [Provider+] providers,shared Configuration[] configurations=[]) {
	shared formal Codamo convertx;
	
	
}