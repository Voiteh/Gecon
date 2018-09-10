import ceylon.language.meta.model {
	Class,
	Interface,
	Type
}
import herd.convertx.core.api.component {
	TypedResolver,
	wired
}
import herd.convertx.core.api {
	Context,
	AnyTuple
}
import ceylon.language.meta {
	type
}
shared wired class StreamToStreamResolver() satisfies  TypedResolver<{Anything*},Interface<{Anything*}>,{Anything*}>{
	
	Class<AnyTuple|Empty> createSequentialType(Type<>[] args){
		
		if(exists element=args.first){
			value first=args.fold(element)((Type<Anything> first, Type<Anything> next) => first.union(next));
			return `class Tuple`.classApply<AnyTuple>(first,element,createSequentialType(args.rest));
		}
		assert(is Class<Empty> emptyType=type(empty));
		return emptyType;
	}
	
	shared actual Class<{Anything*},Nothing> resolve(Context context,{Anything*} input, Interface<{Anything*}> outputType){
		value tupleArgs=input.map((Anything element) => type(element)).sequence();
		assert(is Class<AnyTuple> tupleType=createSequentialType(tupleArgs));
		return tupleType;
	}
	
	matcher => object satisfies StreamToStreamResolver.Matcher{
		
		shared actual Integer priority => 0;
		shared actual Boolean match({Anything*} input, Interface<{Anything*}> outputType) => true;
		
		
		
	};
}