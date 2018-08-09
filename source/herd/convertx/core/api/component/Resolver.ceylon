import ceylon.language.meta.model {
	Class,
	Type,
	ClassOrInterface
}
import herd.convertx.core.internal {
	Executable,
	Findable
}

shared interface TypedResolver<out Base=Anything,out Output=Anything, in Input=Nothing> satisfies Component
		given Input satisfies Type<Base> {
	shared formal Class<Output> resolve(Input type);
	
	
	shared interface Matcher {
		shared formal Boolean match(Input inputType);
		shared formal Integer priority;
	}
	
	shared formal Matcher? matcher;
	
	
	shared actual Findable toFindable(Findable.Adapter visitor) => visitor.adaptResolver(this);
	shared actual Executable toExecutable(Executable.Adapter visitor) => visitor.adaptResolver(this);
}

shared interface Resolver<Output> satisfies TypedResolver<Output,Output,ClassOrInterface<Output>> {
	
	throws (`class ResolvanceException`)
	shared formal actual Class<Output> resolve(ClassOrInterface<Output> type);
	
	
	shared default actual Resolver<Output>.Matcher? matcher=> null;
}
