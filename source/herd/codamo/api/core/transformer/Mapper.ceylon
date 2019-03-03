import ceylon.language.meta.model {
	Type
}
import ceylon.language.meta {
	typeLiteral,
	type
}
shared abstract class Mapper<Source,ResultType,Key=Object,Item=Anything>() 
		satisfies Mapping<Source,ResultType,Key,Item> & Registrable 
		given ResultType satisfies Type<> 
		given Key satisfies Object {
	
	
	shared default Matchable<Source,ResultType>? matchable=null;
	
		
	shared actual Anything visitAdapter(Registrable.Adapter visitor) => visitor.mapping(this, matchable);
	
	string => "``type(this).declaration.name`` ``typeLiteral<Source>()`` -> ``typeLiteral<ResultType>()`` ";
	
	
}