import herd.convertx.core.api.component {
	TypedConverter,
	wired
}
import ceylon.language.meta.model {
	IntersectionType
}
import herd.convertx.core.api {
	Context
}
wired
shared class IntersectionConverter() satisfies TypedConverter<Anything, IntersectionType<Anything>, Anything>{
	shared actual Anything convert(Context context, Anything source, IntersectionType<Anything> resultType) {
		value resolvedType=context.resolve(source,resultType);
		return context.convert(source, resolvedType);
	}
	
	matcher => object satisfies IntersectionConverter.Matcher{
		shared actual Boolean match(Anything source, IntersectionType<Anything> resultType) => true;
		
		shared actual Integer priority = 1;
		
		
	};
	
}