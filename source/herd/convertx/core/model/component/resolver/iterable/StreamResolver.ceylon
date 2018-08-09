import ceylon.collection {
	ArrayList
}
import ceylon.language.meta.model {
	Interface,
	Class
}
import herd.convertx.core.api.component {
	Component,
	TypedResolver
}
service(`interface Component`)
shared class StreamResolver() satisfies  TypedResolver<{Anything*},{Anything*},Interface<{Anything*}>>{
	shared actual Class<{Anything*},Nothing> resolve(Interface<{Anything*}> type){
		value typeForIterable = iterableTypeArgument(type);
		return `class ArrayList`.classApply<Iterable<>>(typeForIterable);
	}
	
	matcher => object satisfies StreamResolver.Matcher{
		shared actual Boolean match(Interface<{Anything*}> inputType)=>true;
		
		shared actual Integer priority => 0;
		
		
	};
}