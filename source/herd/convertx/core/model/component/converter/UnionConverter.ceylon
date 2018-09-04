import ceylon.language.meta.model {
	UnionType
}
import herd.convertx.core.api.component {
	ConvertionException,
	TypedConverter,
	AdaptationException,
	wired
}
import herd.convertx.core.api {
	Context
}
wired
shared class UnionConverter() satisfies TypedConverter<Anything,UnionType<Anything>,Anything>{
	shared actual Anything convert(Context context, Anything source, UnionType<Anything> resultType) {
		for(value type in resultType.caseTypes){
			try {
				return context.convert(source, type);
			} catch (AdaptationException x) {}
		}
		throw ConvertionException(source, resultType,Exception("All converters for types: ``resultType.caseTypes`` failed"));
	}
	
	matcher => object satisfies UnionConverter.Matcher{
		shared actual Boolean match(Anything source, UnionType<Anything> resultType) => true;
		
		shared actual Integer priority = 1;
		
		
	};
	
}