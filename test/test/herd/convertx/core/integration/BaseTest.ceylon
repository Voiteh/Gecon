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
	trace
}
import ceylon.test {
	beforeTestRun
}

beforeTestRun
shared void setupLogger(){
	logger.priority=trace;
	addLogWriter(writeSimpleLog);
}

shared class BaseTest() {
		shared default {Provider*} additionalProviders =>{};
	
		shared default Convertx convertx=>Convertx(*additionalProviders);
	
	
	
}