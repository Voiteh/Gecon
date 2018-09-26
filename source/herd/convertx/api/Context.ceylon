import ceylon.language.meta.model {
	Type,
	Class
}
import herd.convertx.api.component {
	ConvertionException,
	ComponentFindingException,
	ResolvanceException,
	CreationException
}
shared interface Context {
	
	
	throws(`class ConvertionException`,"Converter was not able, to convert to specific type")
	throws(`class ComponentFindingException`,"Converter has not been found")
	shared formal Result convert<Result>(Anything source,Type<Result> resultType);
	
	
	throws(`class ResolvanceException`,"Resolver was not able, resolve specific type")
	throws(`class ComponentFindingException`,"Resolver has not been found")
	shared formal Class<Result> resolve<Result>(Anything source,Type<Result> resultType);
	
	
	throws(`class CreationException`,"Creator was not able to create provided class")
	throws(`class ComponentFindingException`,"Creator has not been found")
	shared formal Result create<Result>(Class<Result> kind,Anything args);
	
}


