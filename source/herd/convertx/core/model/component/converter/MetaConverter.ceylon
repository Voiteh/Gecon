import herd.convertx.api.component {
	wired,
	Converter
}
import herd.convertx.api {
	Context
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

shared wired class MetaConverter() satisfies Converter<Object,Object> {
	shared actual Object convert(Context context, Object source, Type<Object> resultType) {
			value resolvedType = context.resolve(source,resultType);
			value relation=context.convert(source->type(resolvedType), `Relation<>`);
			value partializationType=context.resolve(relation, `Partialization`);
			value partialization=context.create(partializationType,relation);
			return context.create(resolvedType, partialization);
	}
	
	matcher => object satisfies MetaConverter.Matcher{
		shared actual Boolean match(Object source, Type<Object> resultType) => resultType is ClassOrInterface<Object>;
		
		shared actual Integer priority = 0;
		
		
	};

}
