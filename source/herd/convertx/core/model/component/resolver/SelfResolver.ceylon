import ceylon.language.meta.model {
	Class,
	ClassOrInterface
}
import herd.convertx.core.api.component {
	Resolver,
	Component
}
service(`interface Component`)
shared class SelfResolver() satisfies Resolver<Anything>{
	shared actual Class<Anything,Nothing> resolve(ClassOrInterface<Anything> type){
		assert(is Class<Anything> type);
		return type;
	}
	
	matcher=> object satisfies SelfResolver.Matcher{
		shared actual Boolean match(ClassOrInterface<Anything> inputType) => inputType is Class<Anything>;
		
		shared actual Integer priority => 0;
		
		
	};
	
}
