import herd.convertx.core.api.component {
	Component,
	Creator
}
import herd.convertx.core.api.meta.support {
	EntryPartialization
}
import ceylon.collection {
	HashMap
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	Class
}
service(`interface Component`)
shared class EntryPartializationHashMapCreator() satisfies Creator<HashMap<String,Anything>,EntryPartialization>{
	shared actual HashMap<String,Anything> create(Context context, Class<HashMap<String,Anything>,Nothing> kind, EntryPartialization arguments)=>arguments.parts;	
}