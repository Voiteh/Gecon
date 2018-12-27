import herd.codamo.api.core.transformer {
	Transformation
}
import herd.codamo.api.core {
	Scope
}




"Provides definitions of [[Transformation]]s."
shared alias Provider => ManualProvider|AutoProvider;

"Allows manual including of [[Transformation]]s"
shared class ManualProvider(
	"[[Transformation]]s to be included"
	shared Transformation[] transformations
	){}
	
shared class ScopeProvisioning(
		"Wanted resourcess will be provisioned from this [[Scope]]s"
		shared Scope[] scopes,
		"Unwanted resources will be excluded from provisioning by definition of this exclusions"
		shared Scope[] exclusions=[]
		
){}
	
"Automatically includes [[Transformation]]s from specific [[Scope]]"
shared class AutoProvider(
		shared ScopeProvisioning transformations
){}