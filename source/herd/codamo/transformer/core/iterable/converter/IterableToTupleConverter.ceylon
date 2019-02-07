import ceylon.language.meta.model {
	Type,
	Interface,
	Class
}


import herd.codamo.api.core.transformer {
	Converter,
	provided,
	Convertion,
	ConvertionError,
	Delegator
}
import herd.codamo.transformer.core.iterable {
	AnyTuple
}



"Convetes one iterable to tuple. Provided tuple type for example [String,Integer,Boolean] with size 3, must match provided source iterable size."
by("Wojciech Potiopa")
shared provided class IterableToTupleConverter() satisfies Converter<{Anything*},AnyTuple>{
	
	{Type<Anything>*} extractArgsType(Type<Anything> toupleType){
		assert(is Class<Tuple<Anything,Anything,Anything>>|Interface<Empty> toupleType);
		switch(toupleType)
		case (is Interface<Empty>){
			return empty;
		}
		else case (is Class<Tuple<Anything,Anything,Anything>>) {
			assert(exists first=toupleType.typeArgumentList.rest.first);
			assert(exists rest=toupleType.typeArgumentList.rest.rest.first);
			return {first,*extractArgsType(rest)};
		}
	}
	
	shared actual Tuple<Anything,Anything,Anything> convert(Delegator delegator, {Anything*} source, Type<AnyTuple> resultType) {
		value argsType = extractArgsType(resultType);
		if(source.size!=argsType.size){
			throw ConvertionError(source, resultType,Exception("Different sizes of provided source ``source`` to touple argument types ``argsType`` "));
		}
		value sourceIterator=source.iterator();
		value converted=argsType.collect((Type<Anything> element) => element->sourceIterator.next())
				.collect((Type<Anything> type -> Anything item) => delegator.convert(item, type)).sequence();
		value resolvedType=delegator.resolve(converted,resultType);
		return delegator.create(resolvedType, converted);
	}
	
	shared actual Convertion<{Anything*},AnyTuple,Type<AnyTuple>>.Matcher? matcher => object satisfies Convertion<{Anything*},AnyTuple,Type<AnyTuple>>.Matcher{
		
		shared actual Boolean match({Anything*} source, Type<AnyTuple> resultType) => resultType is Class<AnyTuple>;
		
		shared actual Integer priority => 2;

	};
}
