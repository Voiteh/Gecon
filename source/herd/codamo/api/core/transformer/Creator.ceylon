import ceylon.language.meta.model {
	Class
}
import ceylon.language.meta {
	typeLiteral,
	type
}


"Creates a type out of class and arguments, required for creation. This is suppport API used strictly for creation"
by("Wojciech Potiopa")
shared abstract class Creator<Args,Result>()
		satisfies Creation<Args,Result,Result> & Registrable {
	
	
	shared default Matchable<Args,Class<Result>>? matchable=null;
		
	shared formal actual Result create(Delegator delegator, Args arguments,Class<Result,Nothing> kind);
		
	shared actual Anything visitAdapter(Registrable.Adapter visitor) => visitor.creation(this, matchable);
	
	
	string => "``type(this).declaration.name`` ``typeLiteral<Args>()`` -> ``typeLiteral<Result>()`` ";
}


