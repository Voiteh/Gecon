
import herd.convertx.api {
	wired
}
import ceylon.language.meta.model {
	ClassOrInterface,
	Type
}
import herd.convertx.api.meta {
	Partialization,
	Relation
}
import ceylon.language.meta {
	type
}
import herd.convertx.api.operation {
	Convertion,
	Delegator
}
import herd.convertx.api.component {
	Converter
}

shared wired class MetaConverter() satisfies Converter<Object,Object> {
	shared actual Object convert(Delegator delegator, Object source, Type<Object> resultType) {
			value resolvedType = delegator.resolve(source,resultType);
			value relation=delegator.convert(source->type(resolvedType), `Relation<>`);
			value partializationType=delegator.resolve(relation, `Partialization`);
			value partialization=delegator.create(partializationType,relation);
			return delegator.create(resolvedType, partialization);
	}
	
	shared actual Convertion<Object,Object,Type<Object>>.Matcher? matcher => object satisfies Convertion<Object,Object,Type<Object>>.Matcher{
		shared actual Boolean match(Object source, Type<Object> resultType) => resultType is ClassOrInterface<Object>;
		
		shared actual Integer priority = 0;
	};
}		


