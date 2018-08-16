import ceylon.language.meta.model {
	Class,
	Type,
	ClassOrInterface
}
import herd.convertx.core.internal {
	Executable,
	Findable
}

shared interface TypedResolver<out Output=Anything,in OutputType=Nothing, in Input=Nothing> satisfies Component
		given OutputType satisfies Type<Output> {
	shared formal Class<Output> resolve(Input input,OutputType outputType);
	
	
	shared interface Matcher {
		shared formal Boolean match(Input input,OutputType outputType);
		shared formal Integer priority;
	}
	
	shared formal Matcher? matcher;
	
	
	shared actual Findable toFindable(Findable.Adapter visitor) => visitor.adaptResolver(this);
	shared actual Executable toExecutable(Executable.Adapter visitor) => visitor.adaptResolver(this);
}

shared interface Resolver<Output,Input=Output> satisfies TypedResolver<Output,ClassOrInterface<Output>,Input> {
	
	throws (`class ResolvanceException`)
	shared formal actual Class<Output> resolve(Input type,ClassOrInterface<Output> outputType);
	
	
	shared default actual Resolver<Output,Input>.Matcher? matcher=> null;
}
