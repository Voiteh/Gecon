import herd.convertx.core.api.component {
	wired
}
import herd.convertx.json.model.meta {
	JSONPartialization
}
import herd.convertx.json {
	JSONObject,
	JSONValue
}
import ceylon.language.meta.model {
	Attribute,
	Class
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.component.support.meta {
	ObjectPartializer
}
import herd.convertx.core.api.meta {
	Relation
}
wired
shared class ObjectJSONPartializer() extends ObjectPartializer<JSONPartialization, {<String->JSONValue>*}, JSONObject>(){
	shared actual JSONPartialization createPartialization({<String->JSONValue>*} holder) => JSONPartialization(holder);
	
	shared actual {<String->JSONValue>*} mapAttributes(Context context,Object source, {Attribute<Nothing,Anything,Nothing>*} attributes) => attributes.map((Attribute<> element) {
		value val=element.bind(source).get();
		if(is JSONValue val ){
			return element.declaration.name->val;
		}
		else{
			return element.declaration.name->context.convert(val, `JSONValue`);
		}
	});
	
	matcher => object satisfies ObjectJSONPartializer.Matcher{
		shared actual Boolean match(Class<JSONPartialization,Nothing> kind, Relation<Object,JSONObject> arguments) => true;
		
		shared actual Integer priority => 2;
		
		
	};
	
}