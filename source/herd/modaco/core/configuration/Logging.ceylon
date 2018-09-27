import ceylon.logging {
	Priority,
	info
}
import ceylon.language.meta.declaration {
	Package,
	Module
}
import herd.modaco.api.configuration {
	Configuration
}
shared class Logging(
		shared variable Priority priority=info,
		shared actual Package|Module category=`module`
	) satisfies Configuration{}