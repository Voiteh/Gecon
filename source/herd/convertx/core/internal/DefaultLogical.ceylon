
import herd.convertx.core.api.configuration {
	Configurator
}
import herd.convertx.core.api.registration {
	Registrator,
	Visitor
}
import herd.convertx.core.api.search {
	Finder
}
import herd.convertx.core.api {
	Logical
}

shared class DefaultLogical() satisfies Logical{
		
	shared actual Registrator registrator = DefaultRegistrator();
	
	shared actual Finder finder =DefaultFinder();
	
	shared actual Visitor visitor = DefaultVisitor();
	shared actual Configurator configurator = DefaultConfigurator();
	
	
	
}