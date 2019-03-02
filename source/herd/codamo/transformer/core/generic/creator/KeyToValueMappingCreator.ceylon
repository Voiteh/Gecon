import ceylon.language.meta.model {
	Attribute,
	Class
}

import herd.codamo.api.core.meta {
	Relation,
	KeyToValueMapping
}
import herd.codamo.api.core.meta.component {
	ObjectToObjectMapper
}
import herd.codamo.api.core.transformer {
	Delegator,
	Matchable
}




"Creator for [[KeyToValueMapping]]."
tagged("Generic")
by("Wojciech Potiopa")
shared class KeyToValueMappingCreator() extends ObjectToObjectMapper<KeyToValueMapping,{<String->Anything>*},Map<String,Anything>>() {
	shared actual KeyToValueMapping createMapping({<String->Anything>*} holder) => KeyToValueMapping(holder);
	
	shared actual {<String->Anything>*} mapAttributes(Delegator delegator, Object source, {Attribute<Nothing,Anything,Nothing>*} attributes) => attributes.collect((Attribute<Nothing,Anything,Nothing> element) => element.declaration.name -> element.bind(source).get());
	
	
	matchable => object satisfies Matchable<Relation<Object,Map<String,Anything>>,Class<KeyToValueMapping>>{
		shared actual Boolean predicate(Relation<Object,Map<String,Anything>> source, Class<KeyToValueMapping,Nothing> resultType) => true;
		
		shared actual Integer priority =1;
		
		
	};
	
}

