import ceylon.language.meta.model {
	Type
}



import herd.convertx.api.operation {
	Convertion
}

shared interface Converter<Source,Result> 
		satisfies Convertion<Source, Result,Type<Result>> {

	throws(`class ConvertionException`)
	shared actual formal Result convert(Context context,Source source,Type<Result> resultType);
	
	
	
}