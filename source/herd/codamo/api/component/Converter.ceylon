import ceylon.language.meta.model {
	Type
}



import herd.codamo.api.operation {
	Convertion,
	ConvertionError,
	Delegator
}


shared interface Converter<Source,Result> 
		satisfies Convertion<Source, Result,Type<Result>> {

	throws(`class ConvertionError`)
	shared actual formal Result convert(Delegator delegator,Source source,Type<Result> resultType);
	
	
	
}