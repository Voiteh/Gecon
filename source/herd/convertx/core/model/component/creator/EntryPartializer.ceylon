import ceylon.language.meta.model {
	Attribute,
	Class
}

import herd.convertx.api {
	Context,
	wired
}
import herd.convertx.api.meta {
	Relation,
	EntryPartialization
}
import herd.convertx.api.meta.component {
	ObjectPartializer
}






shared wired class EntryPartializer() extends ObjectPartializer<EntryPartialization,{<String->Anything>*},Map<String,Anything>>() {
	shared actual EntryPartialization createPartialization({<String->Anything>*} holder) => EntryPartialization(holder);
	
	shared actual {<String->Anything>*} mapAttributes(Context context, Object source, {Attribute<Nothing,Anything,Nothing>*} attributes) => attributes.map((Attribute<Nothing,Anything,Nothing> element) => element.declaration.name -> element.bind(source).get());
	
	matcher => object satisfies EntryPartializer.Matcher {
		
		shared actual Integer priority => 1;
		shared actual Boolean match(Class<EntryPartialization,Nothing> kind, Relation<Object,Map<String,Anything>> arguments) => true;
		
	};
}
