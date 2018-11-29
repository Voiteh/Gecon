import herd.codamo.api.configuration {
	Configuration
}

"Uses to configure providing object with configuration classes"
shared interface Configurator {

	"Configures provided [[configurable]] object with provided [[configurations]]"	
	shared formal void configure(Object configurable, {Configuration*} configurations);
	
}