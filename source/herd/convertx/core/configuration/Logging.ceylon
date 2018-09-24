import ceylon.logging {
	Priority,
	info
}
import ceylon.language.meta.declaration {
	Package
}
shared class Logging(shared Priority priority=info, shared Package? \ipackage=null) {}