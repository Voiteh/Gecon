
import ceylon.collection {
	HashMap
}

import ceylon.language.meta.model {
	Class
}

import herd.codamo.api.core.meta {
	KeyToValueMapping
}
import herd.codamo.api.core.transformer {
	Creator,
	provided,
	Delegator
}
"Creator for [[HashMap]] uses [[KeyToValueMapping]] as arguments"
tagged("Generic")
by("Wojciech Potiopa")
shared provided class FromKeyToValueMappingHashMapCreator() satisfies Creator<KeyToValueMapping,HashMap<String,Anything>>{
	shared actual HashMap<String,Anything> create(Delegator delegator, Class<HashMap<String,Anything>,Nothing> kind, KeyToValueMapping arguments)=>HashMap<String,Anything>{entries=arguments.mappings;};	
}