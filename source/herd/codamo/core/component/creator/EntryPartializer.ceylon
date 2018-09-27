import ceylon.language.meta.model {
	Attribute,
	Class
}


import herd.codamo.api.meta {
	Relation,
	EntryPartialization
}
import herd.codamo.api.meta.component {
	ObjectPartializer
}
import herd.codamo.api.operation {
	Creation,
	Delegator,
	wired
}






shared wired class EntryPartializer() extends ObjectPartializer<EntryPartialization,{<String->Anything>*},Map<String,Anything>>() {
	shared actual EntryPartialization createPartialization({<String->Anything>*} holder) => EntryPartialization(holder);
	
	shared actual {<String->Anything>*} mapAttributes(Delegator delegator, Object source, {Attribute<Nothing,Anything,Nothing>*} attributes) => attributes.map((Attribute<Nothing,Anything,Nothing> element) => element.declaration.name -> element.bind(source).get());
	
	shared actual Creation<Relation<Object,Map<String,Anything>>,EntryPartialization,EntryPartialization>.Matcher? matcher => object satisfies Creation<Relation<Object,Map<String,Anything>>,EntryPartialization,EntryPartialization>.Matcher{
		shared actual Integer priority => 1;
		shared actual Boolean match(Class<EntryPartialization,Nothing> kind, Relation<Object,Map<String,Anything>> arguments) => true;
		
	};
	
}

