import ceylon.language.meta.model {
	Type,
	Class
}


"Thrown whever there is [[Resolvance]] error"
by("Wojciech Potiopa")
shared class ResolvanceError extends TransformationError {
	shared new (Type<Anything> provisioningType, Throwable? cause = null)
			extends TransformationError("Can't resolve concrete type, for ``provisioningType`` type", cause) {
	}
}
"Base interface for selecting class implementation, for provided interface or abstract class, used as support [[Transformation]]"
by("Wojciech Potiopa")
shared sealed interface Resolvance<in Source=Nothing, out Output=Anything, in OutputType=Nothing> satisfies Transformation
		given OutputType satisfies Type<Output> {
	
	"Allows matching for generic [[Transformation]]s which are not hashable by their definition. This API may change."
	by("Wojciech Potiopa")
	shared interface Matcher {
		shared formal Boolean match(Source input, OutputType outputType);
		shared formal Integer priority;
	}
	
	"Selects non abstract class implementation to be used by other [[Transformation]]s."
	shared formal Class<Output> resolve(
		"Delegates to other [[Transformation]] if possible"
		Delegator delegator,
		"Source data to be used for resolvance" 
		Source input,
		"Abstract output type"
		 OutputType outputType);
	
	"Used inside framework only"
	shared actual Anything flatten(Flatter visitor) => visitor.flattenResolver(this);
	
	
	"Refinable if matcher required for given [[Resolvance]]"
	shared default Matcher? matcher=>null ;
}