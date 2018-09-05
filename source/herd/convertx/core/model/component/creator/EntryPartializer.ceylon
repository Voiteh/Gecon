import ceylon.language.meta.model {
	Attribute
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
	GenericObjectPartializer
}
wired
shared class EntryPartializer() extends GenericObjectPartializer<EntryPartialization, {<String->Anything>*}, Map<String,Anything>>() {
	shared actual EntryPartialization createPartialization({<String->Anything>*} holder) => EntryPartialization(HashMap<String,Anything>{entries=holder;});
	
	shared actual {<String->Anything>*} mapAttributes(Object source, {Attribute<Nothing,Anything,Nothing>*} attributes) =>attributes.map((Attribute<Nothing,Anything,Nothing> element) => element.declaration.name->element.bind(source).get());
	
}
