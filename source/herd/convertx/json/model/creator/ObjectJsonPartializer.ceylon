
import herd.convertx.json.model.meta {
	JsonPartialization
}
import ceylon.language.meta.model {
	Attribute,
	Class
}
import herd.convertx.api {
	Context,
	wired
}
import herd.convertx.api.meta {
	Relation
}
import ceylon.json {
	Value,
	JsonObject
}
import herd.convertx.api.meta.component {
	ObjectPartializer
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