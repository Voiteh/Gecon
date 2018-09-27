import ceylon.language.meta.model {
	Type
}



shared class ConvertionError extends OperationError{
	shared new (Anything source, Type<Anything> destinationType, Throwable? cause = null)
			extends OperationError("Can't adapt ``source else "null"`` to ``destinationType``", cause) {}
}


shared sealed interface Convertion<in Source=Nothing ,out Result=Anything,in ResultType=Nothing> satisfies Operation
		given ResultType satisfies Type<Result> {
	
	
	throws(`class ConvertionError`)
	shared formal Result convert(Delegator delegator,Source source,ResultType resultType);
	
	
	shared actual Anything flatten(Flatter visitor) => visitor.flattenConverter(this);
	
	shared interface Matcher {
		shared formal Boolean match(Source source,ResultType resultType);
		shared formal Integer priority;
	}
	
	shared default Matcher? matcher=>null;
	
}