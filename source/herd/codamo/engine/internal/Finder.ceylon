import ceylon.logging {
	Logger,
	trace
}
import herd.codamo.api.core.transformer {
	TransformationFindingError
}
shared class Finder(Logger logger) {
	shared Executable find(Container container, Anything[] args) {
		//until resolved https://github.com/eclipse/ceylon/issues/7389 hashing for Touple arg will fail. 
		logger.trace("Finding transformer for arguments ``args``"); 
		value hashable=Hashable(*args);
		logger.debug("Looking for Executable using Hashable:``hashable``");
		if (exists findable = container.get(hashable)) {
			logger.debug("FOUND Executable ``findable``");
			return findable;
		}
		logger.debug("Executable NOT FOUND by Hashable ``hashable``");
		if(logger.priority>=trace){
			logger.trace("Available Hashables were:");
			container.filter((Findable elementKey -> Executable elementItem) => elementKey is Hashable)
					.each((Findable findable -> Executable executable) => logger.trace("``findable``-> ``executable``"));
		}
		logger.trace("Matching start");
		if (exists matchable = container.keys.narrow<Matchable>()
			.filter((Matchable element) => element.match(args))
				.collect((Matchable element) { logger.trace("Matched ``element`` to ``args``"); return element;})
				.sort((Matchable x, Matchable y) => y.priority.compare(x.priority))
				.first){
			
			if(exists findable= container.get(matchable)){
				logger.debug("Found ``findable``,for :``args``");
				return findable;
			}
		}else{
			logger.debug("No Matchable available!");
			if(logger.priority>=trace){
				logger.trace("Available Matchables were:");
				container.filter((Findable elementKey -> Executable elementItem) => elementKey is Matchable)
						.each((Findable matchable -> Executable executable) => logger.trace("``matchable``-> ``executable``"));
			}
		}
		throw TransformationFindingError("Can't find component, for provided arguments: ``args``");
	}
}