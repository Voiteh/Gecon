import ceylon.language.meta.model {
	Attribute,
	Type,
	Class
}
import herd.convertx.core.api.component {
	wired
}

import herd.convertx.core.api.meta.support {
	EntryPartialization
}

import ceylon.collection {
	HashMap
}
import herd.convertx.core.api.component.support.meta {
	ObjectPartializer
}
import herd.convertx.core.api {
	Context
}

wired
shared class EntryPartializer() extends ObjectPartializer<EntryPartialization,{<String->Anything>*},Map<String,Anything>>() {
	shared actual EntryPartialization createPartialization({<String->Anything>*} holder) => EntryPartialization(HashMap<String,Anything> { entries = holder; });
	
	shared actual {<String->Anything>*} mapAttributes(Context context, Object source, {Attribute<Nothing,Anything,Nothing>*} attributes) => attributes.map((Attribute<Nothing,Anything,Nothing> element) => element.declaration.name -> element.bind(source).get());
	
	matcher => object satisfies EntryPartializer.Matcher {
		shared actual Boolean match(Class<EntryPartialization,Nothing> kind, Object->Type<Map<String,Anything>> arguments) => true;
		
		shared actual Integer priority => 1;
	};
}
