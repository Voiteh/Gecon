import ceylon.language.meta.model {
	Type
}
import ceylon.language.meta {
	type,
	typeLiteral
}

"Converts provided data into other specific type. This is core API for providing logic into Codamo. 
 It act's as a kind of controller, for many (most of simple) convertions, it is only required component,
  which needs to be implemented and registered."
by("Wojciech Potiopa")
shared abstract class Converter<Source,Result,ResultType=Type<Result>>() 
		satisfies Convertion<Source, Result,ResultType> & Registrable
given ResultType satisfies Type<Result> {
	
	shared default Matchable<Source,ResultType>? matchable=null;
	
	shared formal actual Result convert(Delegator delegator, Source source, ResultType resultType);
	
	shared actual Anything visitAdapter(Registrable.Adapter visitor) => visitor.convertion(this, matchable);
	
	
	
	
	string => "``type(this).declaration.name`` ``typeLiteral<Source>()``-> ``typeLiteral<Result>()`` ";
	
}