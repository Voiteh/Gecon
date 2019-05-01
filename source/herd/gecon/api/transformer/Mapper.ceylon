import ceylon.language.meta {
	typeLiteral,
	type
}
import ceylon.language.meta.model {
	Class
}
import herd.gecon.api.dictionary {
	Dictionary
}

shared abstract class Mapper<Source, Result, Dict>()
		satisfies Mapping<Source,Result,Dict> & Registrable
		given Source satisfies Object
		given Dict satisfies Dictionary<Object,Anything> {
	
	shared class Matcher(
		shared Boolean predicate(Relation<Source,Result> relation, Class<Dict> resultType),
		shared Integer priority) {
	}
	
	shared default Matcher? matcher = null;
	
	shared actual Anything visitAdapter(Registrable.Adapter visitor) => visitor.mapping(this);
	
	string => "``type(this).declaration.name`` ``typeLiteral<Source>()`` -> ``typeLiteral<Result>()`` ";
}
