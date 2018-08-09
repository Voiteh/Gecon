import ceylon.collection {
	ArrayList
}
import ceylon.language.meta.model {
	Interface,
	Class,
	ClassOrInterface
}
import herd.convertx.core.api.component {
	Component,
	TypedResolver
}

service(`interface Component`)
shared class ListResolver() satisfies  TypedResolver<List<>,List<>,ClassOrInterface<List<>>>{
	shared actual Class<List<>,Nothing> resolve(ClassOrInterface<List<>> type) {
		value typeForIterable = iterableTypeArgument(type);
		
		return `class ArrayList`.classApply<List<>>(typeForIterable);
	}
	
	matcher => object satisfies ListResolver.Matcher{
		shared actual Boolean match(ClassOrInterface<List<Anything>> inputType){
			return inputType is Interface<{Anything*}>;
		}
		
		shared actual Integer priority => 1;
		
		
	};
	
}