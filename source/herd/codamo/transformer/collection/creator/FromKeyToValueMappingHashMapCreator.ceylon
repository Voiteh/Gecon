
import ceylon.collection {
	HashMap
}
import ceylon.language.meta.model {
	Class
}

import herd.codamo.api.core.transformer {
	Creator,
	Delegator
}
import herd.codamo.api.core.dictionary {
	KeyToValueDictionary
}
"Creator for [[HashMap]] uses [[KeyToValueDictionary]] as arguments"
tagged("Generic")
by("Wojciech Potiopa")
shared class FromKeyToValueMappingHashMapCreator() extends Creator<KeyToValueDictionary,HashMap<String,Anything>>(){
	shared actual HashMap<String,Anything> create(Delegator delegator, Class<HashMap<String,Anything>,Nothing> kind, KeyToValueDictionary arguments)=>HashMap<String,Anything>{entries=arguments;};	
}