import herd.convertx.api {
	Convertx
}
import ceylon.test {
	testExtension
}
import herd.convertx.api.configuration {
	Configuration
}
import herd.convertx.api.provision {
	Provider
}

import test.base.herd.convertx {
	LoggingTestExtension
}

testExtension(`class LoggingTestExtension`)
shared abstract class IntegrationTest(
	shared [Provider+] providers,shared Configuration[] configurations=[]) {
	shared formal Convertx convertx;
	
	
}