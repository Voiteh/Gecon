import ceylon.language.meta.model {
	Type
}




"Base API for convertion of data into other specified type. For now this interface is selead and should be used inside of the [[herd.codamo.api module]] only. "
by("Wojciech Potiopa")
shared sealed interface Convertion<in Source=Nothing ,out Result=Anything,in ResultType=Nothing> 
		given ResultType satisfies Type<Result> {
	"Should be thrown whenever there is [[Convertion]] error"

	shared class Error extends TransformationError{
		shared new (Anything source, Type<> destinationType, Throwable? cause = null)
				extends TransformationError("Can't adapt ``source else "null"`` to ``destinationType``", cause) {}
	}
	
	"Main convertion API"
	throws(`class Error`,"Whenever there is an error durring convertion")
	shared formal Result convert(
		"Converter may delegate execution of flow to other components via [[Delegator]]"
		Delegator delegator,
		"Data which will be converter"
		Source source,
		"Data type which needs to be produced by [[Convertion]]"
		ResultType resultType);
	
	
	
}