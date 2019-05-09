import ceylon.language.meta.model {
	Type,
	Class
}
import ceylon.logging {
	loggerFactory=logger
}

import herd.gecon.core.api.transformer {
	Delegator,
	TransformationFindingError,
	TransformationError,
	Relation
}
import herd.gecon.core.engine.configuration {
	Configuration
}
import herd.gecon.core.engine.internal {
	TransformationAdapter,
	Registrator,
	Finder
}
import herd.gecon.core.engine.internal.clasification {
	convertion,
	creation,
	resolvance,
	mapping
}
"Codamo transformations class"
by("Wojciech Potiopa")
shared class Gecon(
	"Provides dependencies to Codamo"
	Provider provider,
	"Configuration of Codamo engine"
	Configuration configuration=Configuration()) {
	
	value logger=loggerFactory(`module`);
	logger.priority=configuration.logging.priority;
	value registrator=Registrator(TransformationAdapter(logger), logger);
	value catalog = registrator.register(provider);
	value finder =Finder(logger,catalog);	
	 object delegator satisfies Delegator{
		shared actual Result convert<Result>(Anything source, Type<Result> resultType) {
			value flatten=finder.find(convertion, [source,resultType]);
			return flatten.transform<Result>([this,source,resultType]);	
		}
		
		shared actual Result create<Result>(Class<Result,Nothing> kind, Anything args) {
			value flatten=finder.find(creation, [args,kind]);
			return flatten.transform<Result>([this,args,kind]);
		}
		
		shared actual Class<Result,Nothing> resolve<Result>(Anything source, Type<Result> resultType) {
			value flatten=finder.find(resolvance, [source,resultType]);
			return flatten.transform<Class<Result>>([this,source,resultType]);
		}
		shared actual Dictionary map<Dictionary>(Relation<Anything,Anything> relation, Class<Dictionary,Nothing> dictionaryType)
				given Dictionary satisfies Map<Object,Anything> {
			value flatten=finder.find(mapping,[relation,dictionaryType]);
			return flatten.transform<Dictionary>([relation]);
		}
		
		
		
				
		
	}
	"Main entry point for all transformations"
	shared Result|TransformationError|TransformationFindingError transform<Result>(Anything source,Type<Result> resultType){
		try{
			return delegator.convert(source, resultType);
		}catch(TransformationError|TransformationFindingError x){
			return x;
		}
	}
		
}