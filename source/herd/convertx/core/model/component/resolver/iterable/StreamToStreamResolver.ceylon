import ceylon.collection {
	ArrayList
}
import ceylon.language.meta.model {
	Class,
	Interface
}
import herd.convertx.core.api.component {
	Component,
	TypedResolver
}
service(`interface Component`)
shared class StreamToStreamResolver() satisfies  TypedResolver<{Anything*},Interface<{Anything*}>,{Anything*}>{
	shared actual Class<{Anything*},Nothing> resolve({Anything*} input, Interface<{Anything*}> outputType){
		value typeForIterable = iterableTypeArgument(outputType);
		return `class ArrayList`.classApply<Iterable<>>(typeForIterable);
	}
	
	matcher => object satisfies StreamToStreamResolver.Matcher{
		
		shared actual Integer priority => 0;
		shared actual Boolean match({Anything*} input, Interface<{Anything*}> outputType) => true;
		
		
		
	};
}