
import ceylon.language.meta.model {
	Class,
	Type,
	ClassModel
}

import ceylon.language.meta {
	type
}
import herd.codamo.api.operation {
	Resolvance,
	Delegator
}
import herd.codamo.api.component {
	Resolver
}

import herd.codamo.core.component {
	AnyTuple
}

"Resolves any iterable to [[Tuple]]"
shared class StreamToTupleResolver() satisfies Resolver<{Anything*},AnyTuple>{
	
	
	Class<AnyTuple>|ClassModel<Empty> createTupleType(Type<>[] args){
	
		if(exists element=args.first){
		value first=args.fold(element)((Type<Anything> first, Type<Anything> next) => first.union(next));
			return `class Tuple`.classApply<AnyTuple>(first,element,createTupleType(args.rest));
		}
		return type(empty);	
	}
	
	shared actual Class<AnyTuple> resolve(Delegator delegator, {Anything*} input, Type<AnyTuple> outputType) {
		value tupleArgs=input.map((Anything element) => type(element)).sequence();
		assert(is Class<AnyTuple> tupleType=createTupleType(tupleArgs));
		return tupleType;
	}
	
	shared actual Resolvance<{Anything*},AnyTuple,Type<AnyTuple>>.Matcher? matcher => object satisfies Resolvance<{Anything*},AnyTuple,Type<AnyTuple>>.Matcher{
		shared actual Integer priority => 1;
		shared actual Boolean match({Anything*} input, Type<AnyTuple> outputType) => !input.empty;

	};
	
	
}

