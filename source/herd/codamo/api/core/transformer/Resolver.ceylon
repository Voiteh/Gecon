
import ceylon.language.meta.model {
	Type,
	Class
}
import ceylon.language.meta {
	typeLiteral,
	type
}


"Resolves provided type into class. This is support API only needed for resolvance"
by("Wojciech Potiopa")
shared abstract class Resolver<Source, Result,ResultType=Type<Result>>() 
		satisfies Resolvance<Source,Result,ResultType> & Registrable
		given ResultType satisfies Type<Result>
{
	
	shared formal actual Class<Result,Nothing> resolve(Delegator delegator, Source input, ResultType outputType);
	
	shared default Matchable<Source,ResultType>? matchable=null;
	
	shared actual Anything visitAdapter(Registrable.Adapter visitor) => visitor.resolvance(this, matchable);
	
	string => "``type(this).declaration.name`` ``typeLiteral<Source>()`` -> ``typeLiteral<Result>()`` ";
}
