import ceylon.language.meta {
	type
}
import ceylon.language.meta.model {
	Attribute,
	Class
}

import herd.codamo.api.core.dictionary {
	AttributeDictionary
}
import herd.codamo.api.core.transformer {
	Mapper,
	Matchable,
	Relation
}
import herd.codamo.api.core.util {
	filterObjectAndIdentifiableAttributes
}
shared class DefaultAttributeMapper() extends Mapper<Object,Object,AttributeDictionary>(){
	
	shared actual AttributeDictionary map(Relation<Object,Object> relation) {
		value sourceType = type(relation.source);
		value sourceAttributes=sourceType.getAttributes<>();
		value mapping=relation.resultClass.getAttributes<>()
				.filter(filterObjectAndIdentifiableAttributes)
				.tabulate((Attribute<Nothing,Anything,Nothing> key) => 
			sourceAttributes.find((Attribute<Nothing,Anything,Nothing> item) => key.declaration.name==item.declaration.name)
				?.bind(relation.source)?.get());
		
		return AttributeDictionary(mapping);
	}
	
	matchable= object satisfies Matchable<Relation<Object,Object>,Class<AttributeDictionary>>{
		shared actual Boolean predicate(Relation<Object,Object> source, Class<AttributeDictionary,Nothing> resultType) => true;
		
		shared actual Integer priority => 0;
		
		
	};
	 
}
