import ceylon.language.meta.model {
	Type
}

import herd.gecon.api.transformer {
	Converter,
	Delegator
}
shared class AnythingToAnythingConverter() extends Converter<Anything,Anything,Type<Anything>>(){
	shared actual Anything convert(Delegator delegator, Anything source, Type<Anything> resultType) {
		value resolve = delegator.resolve(source, resultType);
		return delegator.convert(source, resolve);
	}
	
	shared actual Matcher matcher => Matcher{
		 predicate(Anything source, Type<Anything> resultType) => (source is String|Null) && (resultType.subtypeOf(`String|Null`));
		 Integer priority = 0;
		
	};
	
	
	
}