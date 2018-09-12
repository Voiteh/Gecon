import herd.convertx.core.api.component {
	wired
}
import herd.convertx.json.model.meta {
	JsonPartialization
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
import ceylon.json {
	Value,
	JsonObject
}

shared wired class ObjectJSONPartializer() extends ObjectPartializer<JsonPartialization, {<String->Value>*}, JsonObject>(){
	shared actual JsonPartialization createPartialization({<String->Value>*} holder) => JsonPartialization(holder);
	
	shared actual {<String->Value>*} mapAttributes(Context context,Object source, {Attribute<Nothing,Anything,Nothing>*} attributes) => attributes.map((Attribute<> element) {
		value val=element.bind(source).get();
		if(is Value val ){
			return element.declaration.name->val;
		}
		else{
			return element.declaration.name->context.convert(val, `Value`);
		}
	});
	
	matcher => object satisfies ObjectJSONPartializer.Matcher{
		shared actual Boolean match(Class<JsonPartialization,Nothing> kind, Relation<Object,JsonObject> arguments) => true;
		
		shared actual Integer priority => 2;
		
		
	};
	
}