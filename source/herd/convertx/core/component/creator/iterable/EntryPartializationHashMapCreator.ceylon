
import ceylon.collection {
	HashMap
}

import ceylon.language.meta.model {
	Class
}

import herd.convertx.api.meta {
	EntryPartialization
}
import herd.convertx.api.component {
	Creator
}
import herd.convertx.api.operation {
	Delegator,
	wired
}

shared wired class EntryPartializationHashMapCreator() satisfies Creator<EntryPartialization,HashMap<String,Anything>>{
	shared actual HashMap<String,Anything> create(Delegator delegator, Class<HashMap<String,Anything>,Nothing> kind, EntryPartialization arguments)=>HashMap<String,Anything>{entries=arguments.parts;};	
}