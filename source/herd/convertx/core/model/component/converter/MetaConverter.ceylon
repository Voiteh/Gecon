import herd.convertx.core.api.component {
	ConvertionException,
	Component,
	TypedConverter
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	ClassOrInterface
}
service(`interface Component`)
shared class MetaConverter() satisfies TypedConverter<Object,ClassOrInterface<Object>,Object> {
	shared actual Object convert(Context context, Object source, ClassOrInterface<Object> resultType) {
			value resolvedType = context.resolve(resultType);
			value description = context.describe(source, resolvedType);
			value accumulator =context.create(description.accumulatorClass, null);
			for(value part in description.parts){
				value sourcePart = part.obtainable.obtain;
				value destPart=context.convert(sourcePart, part.targetable.type);
				if(exists error=accumulator.accumulate(part.targetable, destPart)){
					throw ConvertionException(source, resultType,error);
				}
			}
			return context.create(resolvedType, accumulator);
	}
	
	matcher => object satisfies MetaConverter.Matcher{
		shared actual Boolean match(Object source, ClassOrInterface<Object> resultType) =>true;
		
		shared actual Integer priority = 0;
		
		
	};

}
