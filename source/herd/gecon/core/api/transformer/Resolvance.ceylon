import ceylon.language.meta.model {
	Type,
	Class
}




"Base interface for selecting class implementation, for provided interface or abstract class, used as support transformation"
by("Wojciech Potiopa")
shared sealed interface Resolvance<in Source=Nothing, out Output=Anything, in OutputType=Nothing> 
		given OutputType satisfies Type<Output> {
	
	
	"Thrown whever there is [[Resolvance]] error"
	
	shared class Error extends TransformationError {
		shared new (Type<Anything> provisioningType, Throwable? cause = null)
				extends TransformationError("Can't resolve concrete type, for ``provisioningType`` type", cause) {
		}
	}
	
	"Selects non abstract class implementation to be used by other transformations."
	throws(`class Error`,"Whenever there is an error durring resolvance")
	shared formal Class<Output> resolve(
		"Delegates to other transformation if possible"
		Delegator delegator,
		"Source data to be used for resolvance" 
		Source input,
		"Abstract output type"
		 OutputType outputType);
	
	
}
