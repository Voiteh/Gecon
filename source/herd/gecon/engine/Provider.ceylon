import herd.gecon.api.transformer {
	Registrable
}
import herd.gecon.api {
	Scope
}




"Provides definitions of transformations."
shared alias Provider => ManualProvider|AutoProvider;

"Allows manual including of transformations"
shared class ManualProvider(
	"transformations to be included"
	shared Registrable[] registrables
	){}
	
shared class ScopeProvisioning(
		"Wanted resourcess will be provisioned from this [[Scope]]s"
		shared Scope[] scopes,
		"Unwanted resources will be excluded from provisioning by definition of this exclusions"
		shared Scope[] exclusions=[]
		
){}
	
"Automatically includes transformations from specific [[Scope]]"
shared class AutoProvider(
		shared ScopeProvisioning transformations
){}