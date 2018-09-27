import ceylon.language.meta.model {
	UnionType,
	Type
}


import herd.convertx.api.operation {
	Convertion,
	OperationError,
	ConvertionError,
	Delegator,
	ComponentFindingException,
	wired
}
import herd.convertx.api.component {
	Converter
}

shared wired class UnionConverter() satisfies Converter<Anything,Anything>{
	shared actual Anything convert(Delegator delegator, Anything source, Type<Anything> resultType) {
		assert(is UnionType<Anything> resultType);
		for(value type in resultType.caseTypes){
			try {
				return delegator.convert(source, type);
			} catch (OperationError|ComponentFindingException x) {}
		}
		throw ConvertionError(source, resultType,Exception("All converters for types: ``resultType.caseTypes`` failed"));
	}
	shared actual Convertion<Anything,Anything,Type<Anything>>.Matcher? matcher => object satisfies Convertion<Anything,Anything,Type<Anything>>.Matcher{
		shared actual Boolean match(Anything source, Type<Anything> resultType) => resultType is UnionType<>;
		
		shared actual Integer priority = 1;

	};
	
}