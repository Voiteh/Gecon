"Experimental API for providing configurations into other classes"
by("Wojciech Potiopa")
shared interface Configurable<in Config=Nothing> given Config satisfies Configuration {
	"Allows configuring class accordingly"
	shared formal void configure(Config configuration);
}