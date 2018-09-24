import ceylon.language.meta.declaration {
	Package,
	Module
}
shared interface Configuration {
	
	shared default Package|Module category => `module`;
	
}