import ceylon.test {
	beforeTestRun
}
import herd.convertx.api {
	Provider,
	Convertx
}
import ceylon.logging {
	addLogWriter,
	writeSimpleLog
}
import herd.convertx.json {
	JsonProvider
}
import herd.convertx.core.model {
	DefaultContext,
	CoreProvider
}
beforeTestRun
shared void setupLogger(){
	addLogWriter(writeSimpleLog);
}

shared class BaseJsonIntegrationTest() {
	
	
	
	shared default [Provider+] providers =>[CoreProvider(), JsonProvider()];
	
	shared default Convertx convertx=>Convertx{
		context=DefaultContext{
			providers = this.providers;
		};
	};
	
	
	
}