import herd.codamo.api.core.transformer {
	Mapper,
	Relation,
	Matchable
}
import herd.codamo.api.core.dictionary {
	KeyToValueDictionary
}
import ceylon.language.meta.model {
	Attribute,
	Class
}
import herd.codamo.api.core.util {
	filterObjectAndIdentifiableAttributes
}
import ceylon.language.meta {
	type
}
shared class SourceKeyValueMapper() extends Mapper
		<Object,{<String->Anything>*},KeyToValueDictionary>
		(){
	shared actual KeyToValueDictionary map(Relation<Object,{<String->Anything>*}> relation) {
		value sourceType = type(relation.source);
		value mapping=sourceType.getAttributes<>()
				.filter(filterObjectAndIdentifiableAttributes)
				.map((Attribute<Nothing,Anything,Nothing> attr) => attr.declaration.name->attr.bind(relation.source).get()) ;
		return KeyToValueDictionary(mapping);
	}
	
	shared actual Matchable<Relation<Object,{<String->Anything>*}>,Class<KeyToValueDictionary,Nothing>>? matchable => object satisfies Matchable<Relation<Object,{<String->Anything>*}>,Class<KeyToValueDictionary,Nothing>>{
		shared actual Boolean predicate(Relation<Object,{<String->Anything>*}> source, Class<KeyToValueDictionary,Nothing> resultType) => true;
		
		shared actual Integer priority => 0;
		
		 
	};
	
}