import herd.convertx.core.api.component {
	Creator,
	wired
}
import herd.convertx.json.model.meta {
	JSONPartialization
}
import herd.convertx.json {
	JSONObject
}
import ceylon.language.meta.model {
	Type,
	Class,
	Attribute
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.component.support.meta {
	GenericObjectPartializer
}
wired
shared class ObjectJSONPartializer() extends GenericObjectPartializer<JSONPartialization, {<String->Anything>*}, JSONObject>(){
	shared actual JSONPartialization createPartialization({<String->Anything>*} holder) => JSONPartialization(holder);
	
	shared actual {<String->Anything>*} mapAttributes(Object source, {Attribute<Nothing,Anything,Nothing>*} attributes) => attributes.map((Attribute<Nothing,Anything,Nothing> element) => element.declaration.name->element.bind(source).get());
	
	
	
}