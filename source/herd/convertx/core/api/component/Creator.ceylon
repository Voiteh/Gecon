import ceylon.language.meta.model {
	Class
}
import herd.convertx.core.internal {
	Executable,
	Findable
}

shared interface TypedCreator<out Result=Anything, in Kind=Nothing, in Args=Nothing> satisfies Component given Kind satisfies Result {
	
	throws (`class ConvertionException`)
	shared formal Result create(Class<Kind> kind, Args arguments);
	
	shared actual Executable toExecutable(Executable.Adapter visitor) => visitor.adaptCreator(this);
	shared actual Findable toFindable(Findable.Adapter visitor) => visitor.adaptCreator(this);
	
	shared interface Matcher {
		shared formal Boolean match(Class<Kind> kind, Args arguments);
		shared formal Integer priority;
	}
	
	shared default Matcher? matcher => null;
}
shared interface Creator<Result, Args> satisfies Component & TypedCreator<Result,Result,Args> {
	
	throws (`class ConvertionException`)
	shared formal actual Result create(Class<Result> kind, Args arguments);
	
	shared default actual Creator<Result,Args>.Matcher? matcher => null;
}
