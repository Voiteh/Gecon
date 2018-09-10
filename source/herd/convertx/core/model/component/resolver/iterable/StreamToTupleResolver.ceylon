import herd.convertx.core.api.component {
	wired,
	Resolver
}
import ceylon.language.meta.model {
	Class,
	ClassOrInterface,
	Type,
	ClassModel
}
import herd.convertx.core.api {
	Context,
	AnyTuple
}
import ceylon.language.meta {
	type
}

shared class StreamToTupleResolver() satisfies Resolver<AnyTuple,{Anything*}>{
	
	
	Class<AnyTuple>|ClassModel<Empty> createTupleType(Type<>[] args){
	
		if(exists element=args.first){
		value first=args.fold(element)((Type<Anything> first, Type<Anything> next) => first.union(next));
			return `class Tuple`.classApply<AnyTuple>(first,element,createTupleType(args.rest));
		}
		return type(empty);	
	}
	
	shared actual Class<AnyTuple> resolve(Context context, {Anything*} input, ClassOrInterface<AnyTuple> outputType) {
		value tupleArgs=input.map((Anything element) => type(element)).sequence();
		assert(is Class<AnyTuple> tupleType=createTupleType(tupleArgs));
		return tupleType;
	}
	
	
	matcher => object satisfies StreamToTupleResolver.Matcher{
		
		shared actual Integer priority => 1;
		shared actual Boolean match({Anything*} input, ClassOrInterface<AnyTuple> outputType) => !input.empty;
		
	};
	
	
}