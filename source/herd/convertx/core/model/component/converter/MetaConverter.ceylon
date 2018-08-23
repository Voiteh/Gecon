import herd.convertx.core.api.component {
	Component,
	TypedConverter
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	ClassOrInterface
}
import herd.convertx.core.api.meta {
	Partialization
}
service(`interface Component`)
shared class MetaConverter() satisfies TypedConverter<Object,ClassOrInterface<Object>,Object> {
	shared actual Object convert(Context context, Object source, ClassOrInterface<Object> resultType) {
			value resolvedType = context.resolve(source,resultType);
			value relations=source->resolvedType;
			value partializationType=context.resolve(relations, `Partialization`);
			value partialization=context.create(partializationType,relations);
			return context.create(resolvedType, partialization);
	}
	
	matcher => object satisfies MetaConverter.Matcher{
		shared actual Boolean match(Object source, ClassOrInterface<Object> resultType) =>true;
		
		shared actual Integer priority = 0;
		
		
	};

}
