import herd.convertx.core.api {
	Provider
}
import herd.convertx.core {
	Convertx
}
import ceylon.logging {
	addLogWriter,
	writeSimpleLog
}
import ceylon.test {
	beforeTestRun
}

beforeTestRun
shared void setupLogger(){
	addLogWriter(writeSimpleLog);
}

shared class BaseTest() {
		shared default {Provider*} additionalProviders =>{};
	
		shared default Convertx convertx=>Convertx(*additionalProviders);
	
	
	
}