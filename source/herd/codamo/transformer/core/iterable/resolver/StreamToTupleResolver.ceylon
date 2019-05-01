
import ceylon.language.meta {
	type
}
import ceylon.language.meta.model {
	Class,
	Type,
	ClassModel
}

import herd.codamo.api.core.transformer {
	Resolver,
	Delegator}
import herd.codamo.transformer.core.iterable {
	AnyTuple
}




"Resolves any iterable to [[Tuple]]"
shared class StreamToTupleResolver() extends Resolver<{Anything*},AnyTuple,Type<AnyTuple>>(){
	
	
	Class<AnyTuple>|ClassModel<Empty> createTupleType(Type<>[] args){
	
		if(exists element=args.first){
		value first=args.fold(element)((Type<Anything> first, Type<Anything> next) => first.union(next));
			return `class Tuple`.classApply<AnyTuple>(first,element,createTupleType(args.rest));
		}
		return type(empty);	
	}
	
	shared actual Class<AnyTuple> resolve(Delegator delegator, {Anything*} input, Type<AnyTuple> outputType) {
		value tupleArgs=input.collect((Anything element) => type(element)).sequence();
		assert(is Class<AnyTuple> tupleType=createTupleType(tupleArgs));
		return tupleType;
	}
	
	matcher => Matcher{
		Boolean predicate({Anything*} source, Type<AnyTuple> resultType) => !source.empty;
		
		Integer priority => 1;
		
		
	};

	
	
	
}

