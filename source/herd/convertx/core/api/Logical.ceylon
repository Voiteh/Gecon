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

shared interface Logical {
	
	shared formal Visitor visitor;
	shared formal Finder finder;
	shared formal Registrator registrator;
	shared formal Configurator configurator;	
}