import ceylon.language.meta.model {
	ClassOrInterface,
	Interface,
	Class
}
import ceylon.collection {
	HashSet
}
import herd.convertx.core.api.component {
	Resolver,
	Component
}
service(`interface Component`)
shared class SetResolver() satisfies Resolver<Set<>>{
	
	shared actual Class<Set<>,Nothing> resolve(ClassOrInterface<Set<>> type) { 
		value typeForIterable = iterableTypeArgument(type);
		return `class HashSet`.classApply<Set<>>(typeForIterable);
	}		
	
	matcher => object satisfies SetResolver.Matcher{
		shared actual Integer priority => 1;
		
		shared actual Boolean match(ClassOrInterface<Set<>> inputType) {
			return inputType is Interface<{Anything*}>;
		}
		
	};
	
	
	
}