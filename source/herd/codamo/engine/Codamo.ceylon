import ceylon.language.meta.model {
	Type,
	Class
}
import ceylon.logging {
	loggerFactory=logger
}

import herd.codamo.api.core.transformer {
	Delegator,
	TransformationFindingError,
	TransformationError
}
import herd.codamo.engine.configuration {
	Configuration
}
import herd.codamo.engine.internal {
	Finder,
	Registrator,
	Flatter
}
"Codamo transformations class"
by("Wojciech Potiopa")
shared class Codamo(
	"Provides dependencies to Codamo"
	Provider provider,
	"Configuration of Codamo engine"
	Configuration configuration=Configuration()
) {
	
	value logger=loggerFactory(`module`);
	logger.priority=configuration.logging.priority;
		value flatter =Flatter(logger);
	value finder =Finder(logger);
	value registry=Registrator(logger,flatter).register(provider);
	 object delegator satisfies Delegator{
		shared actual Result convert<Result>(Anything source, Type<Result> resultType) {
			value flatten=finder.find(registry.converters, [source,resultType]);
			return flatten.execute<Result>([this,source,resultType]);	
		}
		
		shared actual Result create<Result>(Class<Result,Nothing> kind, Anything args) {
			value flatten=finder.find(registry.creators, [kind,args]);
			return flatten.execute<Result>([this,kind,args]);
		}
		
		shared actual Class<Result,Nothing> resolve<Result>(Anything source, Type<Result> resultType) {
			value flatten=finder.find(registry.resolvers, [source,resultType]);
			return flatten.execute<Class<Result>>([this,source,resultType]);
		}
		
	}
	"Main entry point for all transformations"
	
	shared Result|TransformationError|TransformationFindingError convert<Result>(Anything source,Type<Result> resultType){
		try{
			return delegator.convert(source, resultType);
		}catch(TransformationError|TransformationFindingError x){
			return x;
		}
	}
		
}