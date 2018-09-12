import ceylon.test {
	beforeTestRun
}
import herd.convertx.core.api {
	Provider,
	Convertx
}
import ceylon.logging {
	addLogWriter,
	writeSimpleLog
}
import herd.convertx.core {
	CoreConvertx
}
import herd.convertx.json {
	JsonProvider
}
beforeTestRun
shared void setupLogger(){
	addLogWriter(writeSimpleLog);
}

shared class BaseJsonIntegrationTest() {
	shared default {Provider*} additionalProviders =>{ JsonProvider()};
	
	shared default Convertx convertx=>CoreConvertx(*additionalProviders);
	
	
	
}