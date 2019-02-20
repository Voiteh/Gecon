
import ceylon.language.meta.model {
	Type
}


"Resolves provided type into class. This is support API only needed for resolvance"
by("Wojciech Potiopa")
shared abstract class Resolver<Source, Result,ResultType=Type<Result>>() 
		satisfies Resolvance<Source,Result,Type<Result>> & Registrable
		given ResultType satisfies Type<Result>
{
	
	
	shared default Matchable<Source,ResultType>? matchable=null;
	
	shared actual Anything visitAdapter(Registrable.Adapter visitor) => visitor.adapt(this, matchable);
		
}
