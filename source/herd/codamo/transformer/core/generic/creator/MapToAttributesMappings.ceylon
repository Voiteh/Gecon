import ceylon.language.meta.model {
	Class
}
import herd.codamo.api.core.meta {
	Relation,
	AttributesMapping
}
import herd.codamo.api.core.meta.component {
	AttributesMapper
}


import herd.codamo.api.core.transformer {
	provided,
	Creation
}
"Creator for [[Map]]"
tagged("Generic")
by("Wojciech Potiopa")
shared provided class MapToAttributesMappings() extends AttributesMapper<Map<String,Anything>,Object>() {
	shared actual String[] extractSourcePartsKey(Map<String,Anything> source) => source.keys.sequence();
	
	shared actual Anything extractSourcePartValue(Map<String,Anything> source, String key) => source.get(key);
	
	shared actual Creation<Relation<Map<String,Anything>,Object>,AttributesMapping,AttributesMapping>.Matcher? matcher => object satisfies Creation<Relation<Map<String,Anything>,Object>,AttributesMapping,AttributesMapping>.Matcher {
		shared actual Integer priority => 1;
		shared actual Boolean match(Class<AttributesMapping,Nothing> kind, Relation<Map<String,Anything>,Object> arguments) => true;
	};
}
