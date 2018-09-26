import ceylon.language.meta.model {
	Type,
	Interface,
	Class
}
import herd.convertx.api {
	Context,
	AnyTuple,
	Converter,
	ConvertionException,
	wired
}
import herd.convertx.api.operation {
	Convertion
}

shared wired class IterableToTupleConverter() satisfies Converter<{Anything*},AnyTuple>{
	
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
	
	shared actual Tuple<Anything,Anything,Anything> convert(Context context, {Anything*} source, Type<AnyTuple> resultType) {
		value argsType = extractArgsType(resultType);
		if(source.size!=argsType.size){
			throw ConvertionException(source, resultType,Exception("Different sizes of provided source ``source`` to touple argument types ``argsType`` "));
		}
		value sourceIterator=source.iterator();
		value converted=argsType.map((Type<Anything> element) => element->sourceIterator.next())
				.map((Type<Anything> type -> Anything item) => context.convert(item, type)).sequence();
		value resolvedType=context.resolve(converted,resultType);
		return context.create(resolvedType, converted);
	}
	
	shared actual Convertion<{Anything*},AnyTuple,Type<AnyTuple>>.Matcher? matcher => object satisfies Convertion<{Anything*},AnyTuple,Type<AnyTuple>>.Matcher{
		
		shared actual Boolean match({Anything*} source, Type<AnyTuple> resultType) => resultType is Class<AnyTuple>;
		
		shared actual Integer priority => 2;

	};
}
