import ceylon.language.meta.model {
	Type,
	Class
}

"Thrown whenever component has not been found for further operations"
by("Wojciech Potiopa")
shared class TransformationFindingError(String message) extends Exception(message){}

"Delegates execution to other transformations"
shared interface Delegator {
	
	"Tries to find [[Convertion]] for provided [[source]] and [[resultType]], then delegates execution to this transformation"
	throws(`class ConvertionError`,"[[Convertion]] was not able, to convert [[source]] to specific [[resultType]]")
	throws(`class TransformationFindingError`,"Converter has not been found")
		shared formal Result convert<Result>(Anything source,Type<Result> resultType);
	
	"Tries to find [[Resolvance]] for provided [[source]] and [[resultType]], then delegates execution to this transformation"
	throws(`class ResolvanceError`,"Resolver was not able, resolve specific type")
	throws(`class TransformationFindingError`,"Resolver has not been found")
	shared formal Class<Result> resolve<Result>(Anything source,Type<Result> resultType);
	
	"Tries to find [[Creation]] for provided [[kind]] and [[args]], then delegates execution to this transformation"
	throws(`class CreationError`,"Creator was not able to create provided class")
	throws(`class TransformationFindingError`,"Creator has not been found")
	shared formal Result create<Result>(Class<Result> kind,Anything args);
	
}


