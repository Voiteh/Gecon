
import ceylon.language.meta.model {
	IntersectionType,
	Type
}
import herd.convertx.api {
	Context,
	Converter,
	wired
}
import herd.convertx.api.operation {
	Convertion
}

shared wired class IntersectionConverter() satisfies Converter<Anything, Anything>{
	shared actual Anything convert(Context context, Anything source, Type<Anything> resultType) {
		assert(is IntersectionType<> resultType);
		value resolvedType=context.resolve(source,resultType);
		return context.convert(source, resolvedType);
	}
	shared actual Convertion<Anything,Anything,Type<Anything>>.Matcher? matcher => object satisfies Convertion<Anything,Anything,Type<Anything>>.Matcher{
		shared actual Boolean match(Anything source, Type<Anything> resultType) => resultType is IntersectionType<>;
		
		shared actual Integer priority = 1;
	};
	
}

