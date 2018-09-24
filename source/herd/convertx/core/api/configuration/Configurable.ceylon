shared interface Configurable<in Config=Configuration> given Config satisfies Configuration {
	shared formal void configure(Config configuration);
}