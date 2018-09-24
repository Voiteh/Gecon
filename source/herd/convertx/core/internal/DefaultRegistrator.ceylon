
import herd.convertx.core.api.component {
	Component,
	TypedCreator,
	TypedConverter,
	TypedResolver
}
import ceylon.logging {
	logger
}
import herd.convertx.core.api.configuration {
	Configurable
}
import herd.convertx.core.configuration {
	Logging
}
import herd.convertx.core.api.registration {
	Executable,
	Registry,
	Registrator,
	Visitor
}

shared class DefaultRegistrator() satisfies Registrator & Configurable<Logging>{
	value log=logger(`package`);

	shared actual void configure(Logging configuration) {
		log.priority=configuration.priority;
	}


	shared actual void register(Visitor visitor,Registry registry, Component[] components) {
		
		components.each((Component element) {
			value flat=element.flatten(visitor);
			Executable? replaced;
			switch(element)
			case (is TypedConverter<>) {
				replaced=registry.converters.put(*flat);
			}
			case (is TypedResolver<>) {
				replaced=registry.resolvers.put(*flat);
			}
			case (is TypedCreator<>) {
				replaced=registry.creators.put(*flat);
			}
			log.trace("Registered: ``element``");
			if(exists replaced){
				log.warn("Replaced: ``replaced``, with: ``element``");
			}
		
		
	});
	}
	
	
}