
import ceylon.collection {
	HashMap
}
import ceylon.language.meta.model {
	Class
}

import herd.gecon.api.transformer {
	Creator,
	Delegator
}
import herd.gecon.api.dictionary {
	KeyToValueDictionary
}
"Creator for [[HashMap]] uses [[KeyToValueDictionary]] as arguments"
tagged("Generic")
by("Wojciech Potiopa")
shared class FromKeyToValueMappingHashMapCreator() extends Creator<KeyToValueDictionary,HashMap<String,Anything>>(){
	shared actual HashMap<String,Anything> create(Delegator delegator, KeyToValueDictionary arguments, Class<HashMap<String,Anything>,Nothing> kind)=>HashMap<String,Anything>{entries=arguments;};	
}