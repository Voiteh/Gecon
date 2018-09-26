import ceylon.language.meta.model {
	Class,
	Type
}

import herd.convertx.api {
	Context
}

import herd.convertx.api.registration {
	Executable,
	Findable,
	Visitor
}

shared sealed interface TypedResolver<in Source=Nothing, out Output=Anything, in OutputType=Nothing> satisfies Component
		given OutputType satisfies Type<Output> {
	shared formal Class<Output> resolve(Context context, Source input, OutputType outputType);
	
	shared actual [Findable, Executable] flatten(Visitor visitor) => visitor.prepareResolverRegistration(this);
	
	shared interface Matcher {
		shared formal Boolean match(Source input, OutputType outputType);
		shared formal Integer priority;
	}
	
	shared default Matcher? matcher => null;
}

shared interface Resolver<Source, Result> satisfies TypedResolver<Source,Result,Type<Result>> {
	
	throws (`class ResolvanceException`)
	shared formal actual Class<Result> resolve(Context context, Source source, Type<Result> resultType);
	
}
