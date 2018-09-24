import ceylon.logging {
	Priority,
	info
}
import ceylon.language.meta.declaration {
	Package,
	Module
}
import herd.convertx.core.api.configuration {
	Configuration
}
shared class Logging(shared Priority priority=info, shared actual Package|Module category=`module`) satisfies Configuration{}