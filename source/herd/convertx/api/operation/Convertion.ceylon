import ceylon.language.meta.model {
	Type
}

import herd.convertx.api {
	Context,
	ConvertionException
}

import herd.convertx.api.flattening {
	Findable,
	Executable,
	Visitor
}
shared sealed interface Convertion<in Source=Nothing ,out Result=Anything,in ResultType=Nothing> satisfies Operation
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