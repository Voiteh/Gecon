shared interface Configurable<in Config=Nothing> given Config satisfies Configuration {
	shared formal void configure(Config configuration);
}