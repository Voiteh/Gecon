import ceylon.language.meta.model {
	Class
}
import ceylon.language.meta {
	typeLiteral,
	type
}


"Creates a type out of class and arguments, required for creation. This is suppport API used strictly for creation"
by("Wojciech Potiopa")
shared abstract class Creator<Source,Result>()
		satisfies Creation<Source,Result,Result> & Registrable {
	
	
	shared default Matchable<Source,Class<Result>>? matchable=null;
		
	shared formal actual Result create(Delegator delegator, Class<Result,Nothing> kind, Source arguments);
		
	shared actual Anything visitAdapter(Registrable.Adapter visitor) => visitor.creation(this, matchable);
	
	
	string => "``type(this).declaration.name`` ``typeLiteral<Source>()``-> ``typeLiteral<Result>()`` ";
}


