import ceylon.language.meta.model {
	Attribute,
	Class
}


import herd.codamo.api.meta {
	Relation,
	KeyToValueMapping
}
import herd.codamo.api.meta.component {
	ObjectToObjectMapper
}
import herd.codamo.api.operation {
	Creation,
	Delegator,
	wired
}






shared wired class KeyToValueMappingCreator() extends ObjectToObjectMapper<KeyToValueMapping,{<String->Anything>*},Map<String,Anything>>() {
	shared actual KeyToValueMapping createMapping({<String->Anything>*} holder) => KeyToValueMapping(holder);
	
	shared actual {<String->Anything>*} mapAttributes(Delegator delegator, Object source, {Attribute<Nothing,Anything,Nothing>*} attributes) => attributes.map((Attribute<Nothing,Anything,Nothing> element) => element.declaration.name -> element.bind(source).get());
	
	shared actual Creation<Relation<Object,Map<String,Anything>>,KeyToValueMapping,KeyToValueMapping>.Matcher? matcher => object satisfies Creation<Relation<Object,Map<String,Anything>>,KeyToValueMapping,KeyToValueMapping>.Matcher{
		shared actual Integer priority => 1;
		shared actual Boolean match(Class<KeyToValueMapping,Nothing> kind, Relation<Object,Map<String,Anything>> arguments) => true;
		
	};
	
}

