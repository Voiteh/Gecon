import herd.convertx.core.api.component {
	ComponentFindingException
}
import ceylon.logging {
	trace,
	logger
}

import herd.convertx.core.api.logicals {
	Finder,
	Executable,
	Findable,
	Matchable,
	Container
}
import herd.convertx.core.configuration {
	Logging
}
import herd.convertx.core.api.configuration {
	Configurable
}
shared class DefaultFinder() satisfies Finder & Configurable<Logging>{

	value log =logger(`package`);
	
	shared actual void configure(Logging configuration) {
		log.priority=configuration.priority;
	}
	

	shared actual Executable find(Container container, Anything[] args) {
		//until resolved https://github.com/eclipse/ceylon/issues/7389 hashing for Touple arg will fail. 
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
				.sort((Matchable x, Matchable y) => y.priority.compare(x.priority))
				.first){
			if(exists findable= container.get(matchable)){
				return findable;
			}
		}
		throw ComponentFindingException("Can't find component, for provided arguments: ``args``");
	}

	
	
}