import herd.convertx.api.component {
	wired,
	Converter
}
import ceylon.language.meta.model {
	IntersectionType,
	Type
}
import herd.convertx.api {
	Context
}

shared wired class IntersectionConverter() satisfies Converter<Anything, Anything>{
	shared actual Anything convert(Context context, Anything source, Type<Anything> resultType) {
		assert(is IntersectionType<> resultType);
		value resolvedType=context.resolve(source,resultType);
		return context.convert(source, resolvedType);
	}
	
	matcher => object satisfies IntersectionConverter.Matcher{
		shared actual Boolean match(Anything source, Type<Anything> resultType) => resultType is IntersectionType<>;
		
		shared actual Integer priority = 1;
		
		
	};
	
}