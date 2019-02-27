import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.core.transformer {
	Converter,
	Delegator,
	Matchable
}
shared class AnythingToAnythingConverter() extends Converter<Anything,Anything,Type<Anything>>(){
	shared actual Anything convert(Delegator delegator, Anything source, Type<Anything> resultType) {
		value resolve = delegator.resolve(source, resultType);
		return delegator.convert(source, resolve);
	}
	
	matchable => object satisfies Matchable<Anything,Type<Anything>>{
		shared actual Boolean predicate(Anything source, Type<Anything> resultType) => (source is String|Null) && (resultType.subtypeOf(`String|Null`));
		
		shared actual Integer priority =0;
		
		
	};
	
	
}