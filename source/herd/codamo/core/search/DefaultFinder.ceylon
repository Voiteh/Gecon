import ceylon.logging {
	trace,
	logger
}


import herd.codamo.core.configuration {
	Logging
}
import herd.codamo.api.configuration {
	Configurable
}


import herd.codamo.core.search {
	Finder
}
import herd.codamo.core.registration {
	Container
}
import herd.codamo.core.operation {
	DefaultHashable,
	Executable,
	Findable,
	Matchable
}
import herd.codamo.api.operation {
	ComponentFindingError
}
shared class DefaultFinder() satisfies Finder & Configurable<Logging>{

	value log =logger(`package`);
	
	shared actual void configure(Logging configuration) {
		log.priority=configuration.priority;
	}
	

	shared actual Executable find(Container container, Anything[] args) {
		//until resolved https://github.com/eclipse/ceylon/issues/7389 hashing for Touple arg will fail. 
		log.trace("Finding component for arguments ``args``"); 
		value hashable=DefaultHashable(*args);
		log.debug("Looking for Executable using Hashable:``hashable``");
		if (exists findable = container.get(hashable)) {
			log.debug("FOUND Executable ``findable``");
			return findable;
		}
		log.debug("Executable NOT FOUND by Hashable ``hashable``");
		if(log.priority>=trace){
			log.trace("Available Hashables were:");
			container.filter((Findable elementKey -> Executable elementItem) => elementKey is DefaultHashable)
					.each((Findable findable -> Executable executable) => log.trace("``findable``-> ``executable``"));
		}
		if (exists matchable = container.keys.narrow<Matchable>()
			.filter((Matchable element) => element.match(args))
				.map((Matchable element) { log.trace("Matched ``element`` to ``args``"); return element;})
				.sort((Matchable x, Matchable y) => y.priority.compare(x.priority))
				.first){
			
			if(exists findable= container.get(matchable)){
				log.debug("Found ``findable``,for :``args``");
				return findable;
			}
		}
		throw ComponentFindingError("Can't find component, for provided arguments: ``args``");
	}

	
	
}