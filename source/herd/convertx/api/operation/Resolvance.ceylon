import herd.convertx.api.registration {
	Visitor,
	Findable,
	Executable
}
import ceylon.language.meta.model {
	Type,
	Class
}
import herd.convertx.api {
	Context
}
shared sealed interface Resolvance<in Source=Nothing, out Output=Anything, in OutputType=Nothing> satisfies Operation
		given OutputType satisfies Type<Output> {
	shared formal Class<Output> resolve(Context context, Source input, OutputType outputType);
	
	shared actual [Findable, Executable] flatten(Visitor visitor) => visitor.prepareResolverRegistration(this);
	
	shared interface Matcher {
		shared formal Boolean match(Source input, OutputType outputType);
		shared formal Integer priority;
	}
	
	shared formal Matcher? matcher ;
}