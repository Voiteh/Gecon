import herd.convertx.core.api.component {
	TypedConverter,
	wired
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	ClassOrInterface,
	Type
}
import herd.convertx.core.api.meta {
	Partialization
}
import ceylon.language.meta {
	type
}
wired
shared class MetaConverter() satisfies TypedConverter<Object,ClassOrInterface<Object>,Object> {
	shared actual Object convert(Context context, Object source, ClassOrInterface<Object> resultType) {
			value resolvedType = context.resolve(source,resultType);
			value relationsType=`class Entry`.apply<Entry<Object,Type<Anything>>>(type(source),type(resultType));
			value relations=context.convert(source->resultType,relationsType);
			value partializationType=context.resolve(relations, `Partialization`);
			value partialization=context.create(partializationType,relations);
			return context.create(resolvedType, partialization);
	}
	
	matcher => object satisfies MetaConverter.Matcher{
		shared actual Boolean match(Object source, ClassOrInterface<Object> resultType) =>true;
		
		shared actual Integer priority = 0;
		
		
	};

}
