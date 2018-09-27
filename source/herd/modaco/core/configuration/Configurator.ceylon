import herd.modaco.api.configuration {
	Configuration
}
shared interface Configurator {
	
	shared formal void configure(Object configurable, {Configuration*} configurations);
	
}