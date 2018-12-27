import ceylon.logging {
	logger,
	addLogWriter,
	writeSimpleLog
}
import ceylon.test {
	TestListener
}
import ceylon.test.event {
	TestStartedEvent
}
variable Boolean lock=false;
void setupWritter(){
	if(!lock){
		lock=true;
		addLogWriter(writeSimpleLog);
	}
}



shared class LoggingTestExtension() satisfies TestListener{
	setupWritter();
	value log =logger(`module`);
	shared actual void testStarted(TestStartedEvent event) {
		if (exists instance=event.instance) {
			log.info("----- TEST--STARTED ----- ``event.description`` -----");
		}
	}
}