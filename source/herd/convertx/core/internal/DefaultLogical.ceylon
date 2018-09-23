import herd.convertx.core.api.logicals {
	Logical,
	Registrator,
	Finder,
	Visitor,
	Configurator
}

shared class DefaultLogical() satisfies Logical{
		
	shared actual Registrator registrator = DefaultRegistrator();
	
	shared actual Finder finder =DefaultFinder();
	
	shared actual Visitor visitor = DefaultVisitor();
	shared actual Configurator configurator = DefaultConfigurator();
	
	
	
}