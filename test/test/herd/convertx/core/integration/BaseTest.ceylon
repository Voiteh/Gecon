import herd.convertx.core.api {
	Provider
}
import herd.convertx.core {
	Convertx,
	logger
}
import ceylon.logging {
	addLogWriter,
	writeSimpleLog,
	info
}
import ceylon.test {
	beforeTestRun,
	beforeTest,
	TestListener,
	testExtension
}
import ceylon.test.event {
	TestStartedEvent
}

beforeTestRun
shared void setupLogger(){
	addLogWriter(writeSimpleLog);
}

class LoggingTestExtension() satisfies TestListener{
	shared actual void testStarted(TestStartedEvent event) {
		if (exists instance=event.instance) {
			logger.info("----- TEST--STARTED----- ``event.description`` -----");
		}
	}
}

testExtension(`class LoggingTestExtension`)
shared class BaseTest() {
	
		shared beforeTest 
		default void setupLogger(){
			logger.priority=info;
		}
	
	
		shared default {Provider*} additionalProviders =>{};
	
		shared default Convertx convertx=>Convertx(*additionalProviders);
	
	
	
}