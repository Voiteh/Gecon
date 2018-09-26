import herd.convertx.api.component {
	Creator,
	wired
}

import ceylon.collection {
	HashMap
}
import herd.convertx.api {
	Context
}
import ceylon.language.meta.model {
	Class
}

import herd.convertx.api.meta {
	EntryPartialization
}

shared wired class EntryPartializationHashMapCreator() satisfies Creator<EntryPartialization,HashMap<String,Anything>>{
	shared actual HashMap<String,Anything> create(Context context, Class<HashMap<String,Anything>,Nothing> kind, EntryPartialization arguments)=>arguments.parts;	
}