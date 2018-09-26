
import herd.convertx.api {
	Context,
	Converter,
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
	Convertion
}

shared wired class MetaConverter() satisfies Converter<Object,Object> {
	shared actual Object convert(Context context, Object source, Type<Object> resultType) {
			value resolvedType = context.resolve(source,resultType);
			value relation=context.convert(source->type(resolvedType), `Relation<>`);
			value partializationType=context.resolve(relation, `Partialization`);
			value partialization=context.create(partializationType,relation);
			return context.create(resolvedType, partialization);
	}
	
	shared actual Convertion<Object,Object,Type<Object>>.Matcher? matcher => object satisfies Convertion<Object,Object,Type<Object>>.Matcher{
		shared actual Boolean match(Object source, Type<Object> resultType) => resultType is ClassOrInterface<Object>;
		
		shared actual Integer priority = 0;
	};
}		


