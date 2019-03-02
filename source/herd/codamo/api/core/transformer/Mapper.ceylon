import ceylon.language.meta.model {
	Type
}
import ceylon.language.meta {
	typeLiteral,
	type
}
shared abstract class Mapper<Source,ResultType>() 
		satisfies Mapping<Source,ResultType> & Registrable given ResultType satisfies Type<> {
	
	
	shared default Matchable<Source,ResultType>? matchable=null;
	
		
	shared actual Anything visitAdapter(Registrable.Adapter visitor) => visitor.mapping(this, matchable);
	
	string => "``type(this).declaration.name`` ``typeLiteral<Source>()`` -> ``typeLiteral<ResultType>()`` ";
	
	
}