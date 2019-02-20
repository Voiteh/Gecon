import ceylon.logging {
	Logger,
	trace
}
import herd.codamo.engine.internal.clasification {
	Classificator,
	Matcher,
	Hasher,
	Classificable,
	convertion,
	resolvance,
	creation
}
import herd.codamo.api.core.transformer {
	TransformationFindingError
}
shared class Finder(Logger logger,Catalog catalog) {
	
	
	shared Transformation find(Classificator classificator,Anything[] args){
		//until resolved https://github.com/eclipse/ceylon/issues/7389 hashing for Touple arg will fail. 
		logger.trace("Finding transformer for arguments ``args``"); 
		value hashable=Hasher(classificator,*args);
		logger.debug("Looking for Executable using Hashable:``hashable``");
		
		Container container;
		
		switch(classificator)
		case (convertion) {
			container=catalog.converters;
		}
		case (resolvance) {
			container=catalog.resolvers;
		}
		case (creation) {
			container=catalog.creators;
		}
		
		if (exists findable = container.get(hashable)) {
			logger.debug("FOUND Executable ``findable``");
			return findable;
		}
		logger.debug("Executable NOT FOUND by Hashable ``hashable``");
		if(logger.priority>=trace){
			logger.trace("Available Hashables were:");
			container.filter((Classificable elementKey -> Transformation elementItem) => elementKey is Hasher)
					.each((Classificable findable -> Transformation executable) => logger.trace("``findable``-> ``executable``"));
		}
		logger.trace("Matching start");
		if (exists matchable = container.keys.narrow<Matcher>()
			.filter((Matcher element) => element.match(args))
				.collect((Matcher element) { logger.trace("Matched ``element`` to ``args``"); return element;})
				.sort((Matcher x, Matcher y) => y.priority.compare(x.priority))
				.first){
			
			if(exists findable= container.get(matchable)){
				logger.debug("Found ``findable``,for :``args``");
				return findable;
			}
		}else{
			logger.debug("No Matchable available!");
			if(logger.priority>=trace){
				logger.trace("Available Matchables were:");
				container.filter((Classificable elementKey -> Transformation elementItem) => elementKey is Matcher)
						.each((Classificable matchable -> Transformation executable) => logger.trace("``matchable``-> ``executable``"));
			}
		}
		throw TransformationFindingError("Can't find component, for provided arguments: ``args``");
	}
	
	
}