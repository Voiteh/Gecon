import ceylon.language.meta {
	type
}
import ceylon.language.meta.model {
	Class,
	Interface,
	Type
}

import herd.codamo.api.core.transformer {
	Resolver,
	Delegator,
	Matchable
}
import herd.codamo.transformer.core.iterable {
	AnyTuple
}




"Resolves any iterable to [[Tuple]]"
tagged("Generic")
by("Wojciech Potiopa")
shared class StreamToStreamResolver() extends Resolver<{Anything*},{Anything*},Interface<{Anything*}>>(){
	
	Class<AnyTuple|Empty> createSequentialType(Type<>[] args){
		
		if(exists element=args.first){
			value first=args.fold(element)((Type<Anything> first, Type<Anything> next) => first.union(next));
			return `class Tuple`.classApply<AnyTuple>(first,element,createSequentialType(args.rest));
		}
		assert(is Class<Empty> emptyType=type(empty));
		return emptyType;
	}
	
	shared actual Class<{Anything*},Nothing> resolve(Delegator delegator,{Anything*} input, Interface<{Anything*}> outputType){
		value tupleArgs=input.collect((Anything element) => type(element)).sequence();
		assert(is Class<AnyTuple> tupleType=createSequentialType(tupleArgs));
		return tupleType;
	}
	
	matchable => object satisfies Matchable<{Anything*},Interface<{Anything*}>>{
		shared actual Boolean predicate({Anything*} source, Interface<{Anything*}> resultType) => true;
		
		shared actual Integer priority =0;		
	};
	
	
}
