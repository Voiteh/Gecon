import ceylon.language.meta {
	typeLiteral,
	type
}
import ceylon.language.meta.model {
	Class
}
import herd.codamo.api.core.dictionary {
	Dictionary
}

shared abstract class Mapper<Source, Result, Dict>()
		satisfies Mapping<Source,Result,Dict> & Registrable
		given Source satisfies Object
		given Dict satisfies Dictionary<Object,Anything> {
	
	shared default Matchable<Relation<Source,Result>,Class<Dict>>? matchable = null;
	
	shared actual Anything visitAdapter(Registrable.Adapter visitor) => visitor.mapping(this, matchable);
	
	string => "``type(this).declaration.name`` ``typeLiteral<Source>()`` -> ``typeLiteral<Result>()`` ";
}
