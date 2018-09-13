import ceylon.test {
	beforeTestRun,
	beforeTest
}
import herd.convertx.core.api {
	Provider,
	Convertx
}
import ceylon.logging {
	addLogWriter,
	writeSimpleLog,
	info
}
import herd.convertx.core {
	CoreConvertx,
	logger
}
import herd.convertx.json {
	JsonProvider
}
beforeTestRun
shared void setupLogger(){
	addLogWriter(writeSimpleLog);
}

shared class BaseJsonIntegrationTest() {
	
	shared beforeTest 
	default void setupLogger(){
		logger.priority=info;
	}
	
	shared default {Provider*} additionalProviders =>{ JsonProvider()};
	
	shared default Convertx convertx=>CoreConvertx(*additionalProviders);
	
	
	
}