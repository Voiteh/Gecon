
import ceylon.logging {
	logger
}
import herd.codamo.api.core.configuration {
	Configurable
}
import herd.codamo.engine.configuration {
	LoggingConfiguration
}

import herd.codamo.engine.transformation {
	Executable,
	Findable
}
import herd.codamo.api.core.transformer {
	Convertion,
	Transformation,
	Resolvance,
	Creation
}

"Default Registrator implementation"
shared class DefaultRegistrator() satisfies Registrator & Configurable<LoggingConfiguration>{
	value log=logger(`package`);

	shared actual void configure(LoggingConfiguration configuration) {
		log.priority=configuration.priority;
	}


	shared actual void register(Transformation.Flatter visitor,Registry registry, Transformation[] components) {
		
		components.each((Transformation element) {
			assert(is [Findable,Executable] flat=element.flatten(visitor));
			Executable? replaced;
			switch(element)
			case (is Convertion<>) {
				replaced=registry.converters.put(*flat);
			}
			case (is Resolvance<>) {
				replaced=registry.resolvers.put(*flat);
			}
			case (is Creation<>) {
				replaced=registry.creators.put(*flat);
			}
			log.debug("Registered: ``element``");
			if(exists replaced){
				log.warn("Replaced: ``replaced``, with: ``element``");
			}
		});
	}
	
	
}