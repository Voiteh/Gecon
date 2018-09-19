import ceylon.language.meta.model {
	Type
}

import herd.convertx.core.api {
	Context
}
import herd.convertx.core.internal {
	Executable,
	Findable,
	Flatten
}
import ceylon.language.meta {
	typeLiteral,
	type
}

shared sealed interface TypedConverter<in Source=Nothing ,out Result=Anything,in ResultType=Nothing> satisfies Component
		given ResultType satisfies Type<Result> {
	
	throws(`class ConvertionException`)
	shared formal Result convert(Context context,Source source,ResultType resultType);
	
	
	shared actual [Findable, Flatten] register(Visitor visitor) => visitor.prepareConverterRegistration(this);
	
	shared interface Matcher {
		shared formal Boolean match(Source source,ResultType resultType);
		shared formal Integer priority;
	}
	
	shared default Matcher? matcher=>null;
	
}


shared interface Converter<Source,Result> 
		satisfies TypedConverter<Source, Result,Type<Result>> {
	
	shared actual Executable toExecutable(Executable.Adapter visitor) => visitor.adaptConverter(this);
	shared actual Findable toFindable(Findable.Adapter visitor) => visitor.adaptConverter(this);
	
	throws(`class ConvertionException`)
	shared actual formal Result convert(Context context,Source source,Type<Result> resultType);
	
	string => "``type(this).declaration.name``, Source type: ``typeLiteral<Source>()``, Result type: ``typeLiteral<Result>()``";
	
}