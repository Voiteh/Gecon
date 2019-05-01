
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
	
	shared class Matcher(
		shared Boolean predicate(Source source, ResultType resultType),
		shared Integer priority
	){}
	
	shared formal actual Class<Result,Nothing> resolve(Delegator delegator, Source input, ResultType outputType);
	
	shared default Matcher? matcher=null;
	
	shared actual Anything visitAdapter(Registrable.Adapter visitor) => visitor.resolvance(this);
	
	string => "``type(this).declaration.name`` ``typeLiteral<Source>()`` -> ``typeLiteral<Result>()`` ";
}
