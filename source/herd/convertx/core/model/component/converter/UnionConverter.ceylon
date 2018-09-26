import ceylon.language.meta.model {
	UnionType,
	Type
}

import herd.convertx.api {
	Context,
	Converter,
	ConvertionException,
	ConvertxException,
	wired
}

shared wired class UnionConverter() satisfies Converter<Anything,Anything>{
	shared actual Anything convert(Context context, Anything source, Type<Anything> resultType) {
		assert(is UnionType<Anything> resultType);
		for(value type in resultType.caseTypes){
			try {
				return context.convert(source, type);
			} catch (ConvertxException x) {}
		}
		throw ConvertionException(source, resultType,Exception("All converters for types: ``resultType.caseTypes`` failed"));
	}
	
	matcher => object satisfies UnionConverter.Matcher{
		shared actual Boolean match(Anything source, Type<Anything> resultType) => resultType is UnionType<>;
		
		shared actual Integer priority = 1;
		
		
	};
	
}