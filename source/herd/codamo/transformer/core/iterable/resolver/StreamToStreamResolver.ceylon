import ceylon.language.meta.model {
	Class,
	Interface,
	Type
}


import ceylon.language.meta {
	type
}

import herd.codamo.api.core.transformer {
	Resolver,
	provided,
	Resolvance,
	Delegator
}
import herd.codamo.transformer.core.iterable {
	AnyTuple
}




"Resolves any iterable to [[Tuple]]"
tagged("Generic")
by("Wojciech Potiopa")
shared provided class StreamToStreamResolver() satisfies  Resolver<{Anything*},{Anything*}>{
	
	Class<AnyTuple|Empty> createSequentialType(Type<>[] args){
		
		if(exists element=args.first){
			value first=args.fold(element)((Type<Anything> first, Type<Anything> next) => first.union(next));
			return `class Tuple`.classApply<AnyTuple>(first,element,createSequentialType(args.rest));
		}
		assert(is Class<Empty> emptyType=type(empty));
		return emptyType;
	}
	
	shared actual Class<{Anything*},Nothing> resolve(Delegator delegator,{Anything*} input, Type<{Anything*}> outputType){
		value tupleArgs=input.map((Anything element) => type(element)).sequence();
		assert(is Class<AnyTuple> tupleType=createSequentialType(tupleArgs));
		return tupleType;
	}
	
	shared actual Resolvance<{Anything*},{Anything*},Type<{Anything*}>>.Matcher? matcher => object satisfies Resolvance<{Anything*},{Anything*},Type<{Anything*}>>.Matcher{
		
		shared actual Integer priority => 0;
		shared actual Boolean match({Anything*} input, Type<{Anything*}> outputType) => outputType is Interface<{Anything*}>;

	};
	
}
