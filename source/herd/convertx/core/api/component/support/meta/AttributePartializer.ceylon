import herd.convertx.core.api.component {
	Creator,
	CreationException
}

import ceylon.language.meta.model {
	Attribute,
	Class
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.core.util {
	filterObjectAndIdentifiableAttributes
}
import ceylon.collection {
	HashMap
}
import herd.convertx.core.api.meta {
	Relation,
	AttributePartialization
}


shared abstract class AttributePartializer<Source, Result>()
		satisfies Creator<AttributePartialization,Relation<Source,Result>>
		given Source satisfies Object {
	
	
	shared formal String[] extractKeys(Source source);
	shared formal Anything extractValue(Source source, String key);
	shared default Attribute<>? findAttribute(String key,Attribute<>[] resultAttributes)
			=>resultAttributes.find((Attribute<> attribute) => attribute.declaration.name==key);
	
	shared actual AttributePartialization create(Context context, Class<AttributePartialization,Nothing> kind, Relation<Source,Result> arguments) {
		value attributes=arguments.resultClass.getAttributes<>().filter(filterObjectAndIdentifiableAttributes).sequence();
		value entries=extractKeys(arguments.source)
				.map((String key) {
			value attribute=findAttribute(key, attributes);
			if(exists attribute){
				value toConvert=extractValue(arguments.source, key);
				value part=context.convert(toConvert, attribute.type);
				return attribute->part;
			}
			else{
				throw CreationException(kind,Exception("Can't find attribute by name: ``key`` in ``arguments.resultClass`` type"));
			}
		});
		return AttributePartialization(HashMap<Attribute<>,Anything>{entries=entries;});
	}
	
	 
	
	
	
}
