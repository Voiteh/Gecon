import herd.convertx.core.api.component {
	Resolver,
	Component
}
import herd.convertx.core.api.meta {
	Partialization
}
import ceylon.language.meta.model {
	Type,
	Class,
	ClassOrInterface
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.meta.support {
	EntryPartialization
}
service(`interface Component`)
shared class EntryPartializationResolver() satisfies Resolver<Partialization,Object->Type<Map<String,Anything>>>{
	shared actual Class<Partialization,Nothing> resolve(Context context, Object->Type<Map<String,Anything>> type, ClassOrInterface<Partialization> outputType) =>`EntryPartialization`;
	

	matcher=> object satisfies EntryPartializationResolver.Matcher{
		shared actual Boolean match(Object->Type<Map<String,Anything>> input, ClassOrInterface<Partialization> outputType) => true;
		
		shared actual Integer priority => 1;
		
		
	};
		
}