import ceylon.logging {
	Priority,
	info
}

import herd.codamo.api.configuration {
	Configuration
}
import herd.codamo.api {
	Scope
}
"Logging configuration class"
by("Wojciech Potiopa")
shared class LoggingConfiguration(
		"Priority of logging"
		shared variable Priority priority=info,
		"Scopes configuration for specific usage"
		shared actual Scope scope=`module`
	) satisfies Configuration{}