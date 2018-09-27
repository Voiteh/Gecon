import ceylon.language.meta.model {
	Type,
	Class
}



shared class ResolvanceError extends OperationError {
	shared new (Type<Anything> provisioningType, Throwable? cause = null)
			extends OperationError("Can't resolve concrete type, for ``provisioningType`` type", cause) {
	}
}

shared sealed interface Resolvance<in Source=Nothing, out Output=Anything, in OutputType=Nothing> satisfies Operation
		given OutputType satisfies Type<Output> {
	
	shared interface Matcher {
		shared formal Boolean match(Source input, OutputType outputType);
		shared formal Integer priority;
	}
	
	shared formal Class<Output> resolve(Delegator delegator, Source input, OutputType outputType);
	
	shared actual Anything flatten(Flatter visitor) => visitor.flattenResolver(this);
	
	
	
	shared default Matcher? matcher=>null ;
}