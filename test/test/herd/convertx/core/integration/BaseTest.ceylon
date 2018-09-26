import herd.convertx.api {
	Provider,
	Convertx
}
import ceylon.logging {
	addLogWriter,
	writeSimpleLog,
	logger,
	info
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
import herd.convertx.core.configuration {
	Logging
}
import herd.convertx.api.configuration {
	Configuration
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
	
	shared default Configuration[] configurations=[Logging(info,`module herd.convertx.core`)];
	
	shared default {Provider*} providers => [
		CoreProvider{
			additionalConfiguration = configurations;
		}
	];
	shared Convertx convertx => Convertx(
		DefaultContext{
			providers=providers;
		});
	
	
}