
import ceylon.collection {
	HashMap
}

import ceylon.language.meta.model {
	Class
}

import herd.modaco.api.meta {
	EntryPartialization
}
import herd.modaco.api.component {
	Creator
}
import herd.modaco.api.operation {
	Delegator,
	wired
}

shared wired class EntryPartializationHashMapCreator() satisfies Creator<EntryPartialization,HashMap<String,Anything>>{
	shared actual HashMap<String,Anything> create(Delegator delegator, Class<HashMap<String,Anything>,Nothing> kind, EntryPartialization arguments)=>HashMap<String,Anything>{entries=arguments.parts;};	
}