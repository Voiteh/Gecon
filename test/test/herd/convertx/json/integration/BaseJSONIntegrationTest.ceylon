import ceylon.test {
	beforeTestRun
}
import herd.convertx.core.api {
	Provider
}
import ceylon.logging {
	addLogWriter,
	writeSimpleLog
}
import herd.convertx.core {
	Convertx
}
import herd.convertx.json {
	JSONProvider
}
beforeTestRun
shared void setupLogger(){
	addLogWriter(writeSimpleLog);
}

shared class BaseJSONIntegrationTest() {
	shared default {Provider*} additionalProviders =>{ JSONProvider()};
	
	shared default Convertx convertx=>Convertx(*additionalProviders);
	
	
	
}