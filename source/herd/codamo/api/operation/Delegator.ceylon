import ceylon.language.meta.model {
	Type,
	Class
}


shared class ComponentFindingError(String message) extends Exception(message){}


shared interface Delegator {
	
	
	throws(`class ConvertionError`,"Converter was not able, to convert to specific type")
	throws(`class ComponentFindingError`,"Converter has not been found")
	shared formal Result convert<Result>(Anything source,Type<Result> resultType);
	
	
	throws(`class ResolvanceError`,"Resolver was not able, resolve specific type")
	throws(`class ComponentFindingError`,"Resolver has not been found")
	shared formal Class<Result> resolve<Result>(Anything source,Type<Result> resultType);
	
	
	throws(`class CreationError`,"Creator was not able to create provided class")
	throws(`class ComponentFindingError`,"Creator has not been found")
	shared formal Result create<Result>(Class<Result> kind,Anything args);
	
}


