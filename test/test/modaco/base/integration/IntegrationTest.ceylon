import herd.modaco.api {
	Convertx
}
import ceylon.test {
	testExtension
}
import herd.modaco.api.configuration {
	Configuration
}
import herd.modaco.api.provision {
	Provider
}

import test.modaco.base {
	LoggingTestExtension
}

testExtension(`class LoggingTestExtension`)
shared abstract class IntegrationTest(
	shared [Provider+] providers,shared Configuration[] configurations=[]) {
	shared formal Convertx convertx;
	
	
}