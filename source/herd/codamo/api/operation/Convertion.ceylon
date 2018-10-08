import ceylon.language.meta.model {
	Type
}


"Should be thrown whenever there is [[Convertion]] error"
shared class ConvertionError extends OperationError{
	shared new (Anything source, Type<Anything> destinationType, Throwable? cause = null)
			extends OperationError("Can't adapt ``source else "null"`` to ``destinationType``", cause) {}
}

"Base interface identifying API for convertion of data into other specified type"
shared sealed interface Convertion<in Source=Nothing ,out Result=Anything,in ResultType=Nothing> satisfies Operation
		given ResultType satisfies Type<Result> {
	
	"Main convertion API"
	throws(`class ConvertionError`,"Whenever there is an error durring convertion")
	shared formal Result convert(
		"Converter may delegate execution of flow to other components via [[Delegator]]"
		Delegator delegator,
		"Data which will be converter"
		Source source,
		"Data type which needs to be produced by [[Convertion]]"
		ResultType resultType);
	
	
	shared actual Anything flatten(Flatter visitor) => visitor.flattenConverter(this);
	
	"Allows matching for generic [[Operation]]s which are not hashable by their definition. This API may change."
	shared interface Matcher {
		"Checks wheter given arguments for [[Convertion]] will be applicable"
		shared formal Boolean match(Source source,ResultType resultType);
		"Priority of this [[Convertion]], whenever found [[Convertion]] with higher [[priority]], it will be selected for execution."
		shared formal Integer priority;
	}
	"Refinable if matcher required for given [[Convertion]]"
	shared default Matcher? matcher=>null;
	
}