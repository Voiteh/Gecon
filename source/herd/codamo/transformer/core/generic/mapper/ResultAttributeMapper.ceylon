import herd.codamo.api.core.transformer {
	Mapper,
	Relation,
	Matchable
}
import herd.codamo.api.core.dictionary {
	AttributeDictionary
}
import ceylon.language.meta.model {
	Attribute,
	Class
}
import herd.codamo.api.core.util {
	filterObjectAndIdentifiableAttributes
}
shared class ResultAttributeMapper() extends Mapper
<{<String->Anything>*},Object,AttributeDictionary>
(){
	shared actual AttributeDictionary map(Relation<{<String->Anything>*},Object> relation) {
		value mapping=relation.resultClass.getAttributes<>()
				.filter(filterObjectAndIdentifiableAttributes)
				.tabulate((Attribute<Nothing,Anything,Nothing> key) => relation.source.find((String elementKey -> Anything elementItem) => key.declaration.name==elementKey)?.item);
	return AttributeDictionary(mapping);
	}
	
	
	shared actual Matchable<Relation<{<String->Anything>*},Object>,Class<AttributeDictionary,Nothing>>? matchable => object satisfies Matchable<Relation<{<String->Anything>*},Object>,Class<AttributeDictionary,Nothing>>{
		shared actual Boolean predicate(Relation<{<String->Anything>*},Object> source, Class<AttributeDictionary,Nothing> resultType) => true;
		
		shared actual Integer priority => 1;
		
		
	};
	
}