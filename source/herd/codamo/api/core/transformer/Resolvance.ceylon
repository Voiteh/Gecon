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
"Base interface for selecting class implementation, for provided interface or abstract class, used as support transformation"
by("Wojciech Potiopa")
shared sealed interface Resolvance<in Source=Nothing, out Output=Anything, in OutputType=Nothing> 
		given OutputType satisfies Type<Output> {
	
	
	"Selects non abstract class implementation to be used by other transformations."
	shared formal Class<Output> resolve(
		"Delegates to other transformation if possible"
		Delegator delegator,
		"Source data to be used for resolvance" 
		Source input,
		"Abstract output type"
		 OutputType outputType);
	
	
}
