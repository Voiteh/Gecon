import ceylon.language.meta.model {
	Type
}

import herd.convertx.core.api {
	Context
}
import herd.convertx.core.internal {
	Executable,
	Findable
}

shared interface TypedConverter<in Source=Nothing ,in ResultType=Nothing,out Result=Anything> satisfies Component
		given ResultType satisfies Type<Result> {
	
	throws(`class ConvertionException`)
	shared formal Result convert(Context context,Source source,ResultType resultType);
	
	shared actual Executable toExecutable(Executable.Adapter visitor) => visitor.adaptConverter(this);
	shared actual Findable toFindable(Findable.Adapter visitor) => visitor.adaptConverter(this);
	
	
	shared interface Matcher {
		shared formal Boolean match(Source source,ResultType resultType);
		shared formal Integer priority;
	}
	
	shared default Matcher? matcher=>null;
	
}


shared interface Converter<Source,Result> 
		satisfies TypedConverter<Source, Type<Result>,Result> {
	
	
	
	throws(`class ConvertionException`)
	shared actual formal Result convert(Context context,Source source,Type<Result> resultType);
	
	
	shared default actual Converter<Source,Result>.Matcher? matcher=>null;
	
	
}