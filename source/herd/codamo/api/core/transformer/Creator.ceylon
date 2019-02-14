import ceylon.language.meta.model {
	Class
}


"Creates a type out of provided class and arguments, required for creation. This is suppport API used strictly for creation"
by("Wojciech Potiopa")
shared abstract class Creator<Args,Result,ResultType=Class<Result>>()
		satisfies  Creation<Args,Result,ResultType> & Registrable
		given ResultType satisfies Class<Result> {
	
	
	shared default Matcher<Args,ResultType>? matcher=null;
		
	shared actual Anything visitAdapter(Registrable.Adapter visitor) => visitor.adapt(this, matcher);
	
	
	
}


