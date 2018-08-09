import herd.convertx.core.api.component {
	TypedConverter,
	Component
}
import ceylon.language.meta.model {
	IntersectionType
}
import herd.convertx.core.api {
	Context
}
service(`interface Component`)
shared class IntersectionConverter() satisfies TypedConverter<Anything, IntersectionType<Anything>, Anything>{
	shared actual Anything convert(Context context, Anything source, IntersectionType<Anything> resultType) {
		value resolvedType=context.resolve(resultType);
		return context.convert(source, resolvedType);
	}
	
	matcher => object satisfies IntersectionConverter.Matcher{
		shared actual Boolean match(Anything source, IntersectionType<Anything> resultType) => true;
		
		shared actual Integer priority = 1;
		
		
	};
	
}