import ceylon.language.meta.model {
	Type
}


"Should be thrown whenever there is [[Convertion]] error"
by("Wojciech Potiopa")
shared class ConvertionError extends TransformationError{
	shared new (Anything source, Type<Anything> destinationType, Throwable? cause = null)
			extends TransformationError("Can't adapt ``source else "null"`` to ``destinationType``", cause) {}
}

"Base API for convertion of data into other specified type. For now this interface is selead and should be used inside of the [[herd.codamo.api module]] only. "
by("Wojciech Potiopa")
shared sealed interface Convertion<in Source=Nothing ,out Result=Anything,in ResultType=Nothing> satisfies Transformation
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
	
	"Used inside framework only"
	shared actual Anything flatten(Flatter visitor) => visitor.flattenConverter(this);
	
	"Allows matching for generic [[Transformation]]s which are not hashable by their definition. This API may change."
	by("Wojciech Potiopa")
	shared interface Matcher {
		"Checks wheter given arguments for [[Convertion]] will be applicable"
		shared formal Boolean match(Source source,ResultType resultType);
		"Priority of this [[Convertion]], whenever found [[Convertion]] with higher [[priority]], it will be selected for execution."
		shared formal Integer priority;
	}
	"Refinable if matcher required for given [[Convertion]]"
	shared default Matcher? matcher=>null;
	
}