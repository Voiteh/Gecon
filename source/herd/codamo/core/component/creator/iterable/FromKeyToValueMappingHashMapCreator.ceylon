
import ceylon.collection {
	HashMap
}

import ceylon.language.meta.model {
	Class
}

import herd.codamo.api.meta {
	KeyToValueMapping
}
import herd.codamo.api.component {
	Creator
}
import herd.codamo.api.operation {
	Delegator,
	wired
}
"Creator for [[HashMap]] uses [[KeyToValueMapping]] as arguments"
tagged("Generic")
by("Wojciech Potiopa")
shared wired class FromKeyToValueMappingHashMapCreator() satisfies Creator<KeyToValueMapping,HashMap<String,Anything>>{
	shared actual HashMap<String,Anything> create(Delegator delegator, Class<HashMap<String,Anything>,Nothing> kind, KeyToValueMapping arguments)=>HashMap<String,Anything>{entries=arguments.mappings;};	
}