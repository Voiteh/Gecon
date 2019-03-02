import ceylon.language.meta.model {
	Class
}

import herd.codamo.api.core.meta {
	Relation,
	AttributesMapping
}
import herd.codamo.api.core.meta.component {
	AttributesMapper
}
import herd.codamo.api.core.transformer {
	Matchable
}
"Creator for [[Map]]"
tagged("Generic")
by("Wojciech Potiopa")
shared class MapToAttributesMappings() extends AttributesMapper<Map<String,Anything>,Object>() {
	shared actual String[] extractSourcePartsKey(Map<String,Anything> source) => source.keys.sequence();
	
	shared actual Anything extractSourcePartValue(Map<String,Anything> source, String key) => source.get(key);
	
	matchable=> object satisfies Matchable<Relation<Map<String,Anything>,Object>,Class<AttributesMapping>>{
		shared actual Boolean predicate(Relation<Map<String,Anything>,Object> source, Class<AttributesMapping,Nothing> resultType) => true;
		
		shared actual Integer priority =1 ;
		
		
	};
	
}
