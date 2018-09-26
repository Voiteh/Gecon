import ceylon.language.meta.model {
	Type
}

import herd.convertx.core.api {
	Context
}


import herd.convertx.core.api.registration {
	Executable,
	Findable,
	Visitor
}

shared sealed interface TypedConverter<in Source=Nothing ,out Result=Anything,in ResultType=Nothing> satisfies Component
		given ResultType satisfies Type<Result> {
	
	throws(`class ConvertionException`)
	shared formal Result convert(Context context,Source source,ResultType resultType);
	
	
	shared actual [Findable, Executable] flatten(Visitor visitor) => visitor.prepareConverterRegistration(this);
	
	shared interface Matcher {
		shared formal Boolean match(Source source,ResultType resultType);
		shared formal Integer priority;
	}
	
	shared default Matcher? matcher=>null;
	
}


shared interface Converter<Source,Result> 
		satisfies TypedConverter<Source, Result,Type<Result>> {
	
	
	throws(`class ConvertionException`)
	shared actual formal Result convert(Context context,Source source,Type<Result> resultType);
	
	
}