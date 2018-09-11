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

shared interface TypedResolver<out Output=Anything,in OutputType=Nothing, in Input=Nothing> satisfies Component
		given OutputType satisfies Type<Output> {
	shared formal Class<Output> resolve(Context context,Input input,OutputType outputType);
	
	
	shared interface Matcher {
		shared formal Boolean match(Input input,OutputType outputType);
		shared formal Integer priority;
	}
	
	shared formal Matcher? matcher;
	
	
	shared actual Findable toFindable(Findable.Adapter visitor) => visitor.adaptResolver(this);
	shared actual Executable toExecutable(Executable.Adapter visitor) => visitor.adaptResolver(this);
}

shared interface Resolver<Output,Input=Output> satisfies TypedResolver<Output,Type<Output>,Input> {
	
	throws (`class ResolvanceException`)
	shared formal actual Class<Output> resolve(Context context,Input type,Type<Output> outputType);
	
	
}
