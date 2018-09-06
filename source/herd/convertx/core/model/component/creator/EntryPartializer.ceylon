import ceylon.language.meta.model {
	Attribute,
	Class
}
import herd.convertx.core.api.component {
	wired
}



import herd.convertx.core.api.component.support.meta {
	ObjectPartializer
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.meta {
	Relation
}
import herd.convertx.core.model.meta {
	EntryPartialization
}

wired
shared class EntryPartializer() extends ObjectPartializer<EntryPartialization,{<String->Anything>*},Map<String,Anything>>() {
	shared actual EntryPartialization createPartialization({<String->Anything>*} holder) => EntryPartialization(holder);
	
	shared actual {<String->Anything>*} mapAttributes(Context context, Object source, {Attribute<Nothing,Anything,Nothing>*} attributes) => attributes.map((Attribute<Nothing,Anything,Nothing> element) => element.declaration.name -> element.bind(source).get());
	
	matcher => object satisfies EntryPartializer.Matcher {
		
		shared actual Integer priority => 1;
		shared actual Boolean match(Class<EntryPartialization,Nothing> kind, Relation<Object,Map<String,Anything>> arguments) => true;
		
	};
}
