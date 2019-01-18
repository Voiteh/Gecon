import herd.codamo.api.core.transformer {
	Converter,
	Delegator,
	Convertion
}
import ceylon.language.meta.model {
	Type
}
shared class AnythingToAnythingConverter() satisfies Converter<Anything,Anything>{
	shared actual Anything convert(Delegator delegator, Anything source, Type<Anything> resultType) {
		value resolve = delegator.resolve(source, resultType);
		return delegator.convert(source, resolve);
	}
	shared actual Convertion<Anything,Anything,Type<Anything>>.Matcher? matcher => object satisfies Convertion<Anything,Anything,Type<Anything>>.Matcher{
		shared actual Boolean match(Anything source, Type<Anything> resultType) => (source is String|Null) && (resultType.subtypeOf(`String|Null`));
		
		shared actual Integer priority => 0;
		
		
	};
}