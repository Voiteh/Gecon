import herd.convertx.core.api.component {
	TypedConverter,
	wired
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	ClassOrInterface
}
import herd.convertx.core.api.meta {
	Partialization,
	Relation
}
import ceylon.language.meta {
	type
}
wired
shared class MetaConverter() satisfies TypedConverter<Object,ClassOrInterface<Object>,Object> {
	shared actual Object convert(Context context, Object source, ClassOrInterface<Object> resultType) {
			value resolvedType = context.resolve(source,resultType);
			value relation=context.convert(source->type(resolvedType), `Relation<>`);
			value partializationType=context.resolve(relation, `Partialization`);
			value partialization=context.create(partializationType,relation);
			return context.create(resolvedType, partialization);
	}
	
	matcher => object satisfies MetaConverter.Matcher{
		shared actual Boolean match(Object source, ClassOrInterface<Object> resultType) =>true;
		
		shared actual Integer priority = 0;
		
		
	};

}
