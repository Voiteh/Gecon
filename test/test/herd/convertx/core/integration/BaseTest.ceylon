import herd.convertx.core.api {
	Provider,
	Convertx
}
import ceylon.logging {
	addLogWriter,
	writeSimpleLog,
	logger
}
import ceylon.test {
	beforeTestRun,
	TestListener,
	testExtension
}
import ceylon.test.event {
	TestStartedEvent
}
import herd.convertx.core.model {
	CoreProvider,
	DefaultContext
}

beforeTestRun
shared void setupLogger(){
	addLogWriter(writeSimpleLog);
}

class LoggingTestExtension() satisfies TestListener{
	value log =logger(`module`);
	shared actual void testStarted(TestStartedEvent event) {
		if (exists instance=event.instance) {
			log.info("----- TEST--STARTED ----- ``event.description`` -----");
		}
	}
}

testExtension(`class LoggingTestExtension`)
shared class BaseTest() {
	
	
	
	shared default [Provider+] providers =>[CoreProvider()];
	
	shared default Convertx convertx=>Convertx{
		context=DefaultContext{
			providers = this.providers;
		};
	};
	
	
}