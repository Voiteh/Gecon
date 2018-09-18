import ceylon.language.meta.model {
	Class,
	Type
}
import herd.convertx.core.internal {
	Executable,
	Findable
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta {
	typeLiteral,
	type
}

shared sealed interface TypedResolver<in Source=Nothing, out Output=Anything, in OutputType=Nothing> satisfies Component
		given OutputType satisfies Type<Output> {
	shared formal Class<Output> resolve(Context context, Source input, OutputType outputType);
	
	shared actual [Findable, Executable] register(Visitor visitor) => visitor.prepareResolverRegistration(this);
	
	shared interface Matcher {
		shared formal Boolean match(Source input, OutputType outputType);
		shared formal Integer priority;
	}
	
	shared default Matcher? matcher => null;
}

shared interface Resolver<Source, Result> satisfies TypedResolver<Source,Result,Type<Result>> {
	
	throws (`class ResolvanceException`)
	shared formal actual Class<Result> resolve(Context context, Source source, Type<Result> resultType);
	
	shared actual Findable toFindable(Findable.Adapter visitor) => visitor.adaptResolver(this);
	shared actual Executable toExecutable(Executable.Adapter visitor) => visitor.adaptResolver(this);
	
	string => "``type(this).declaration.name``, Source type: ``typeLiteral<Source>()``, Result type: ``typeLiteral<Result>()``";
}
