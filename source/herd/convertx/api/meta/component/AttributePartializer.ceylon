

import ceylon.language.meta.model {
	Attribute,
	Class
}

import herd.convertx.api.meta {
	Relation,
	AttributePartialization,
	filterObjectAndIdentifiableAttributes
}
import herd.convertx.api.operation {
	CreationError,
	Delegator
}
import herd.convertx.api.component {
	Creator
}



shared abstract class AttributePartializer<Source, Result>()
		satisfies Creator<Relation<Source,Result>,AttributePartialization>
		given Source satisfies Object {
	
	
	shared formal String[] extractKeys(Source source);
	shared formal Anything extractValue(Source source, String key);
	shared default Attribute<>? findAttribute(String key,Attribute<>[] resultAttributes)
			=>resultAttributes.find((Attribute<> attribute) => attribute.declaration.name==key);
	
	shared actual AttributePartialization create(Delegator delegator, Class<AttributePartialization,Nothing> kind, Relation<Source,Result> arguments) {
		value attributes=arguments.resultClass.getAttributes<>().filter(filterObjectAndIdentifiableAttributes).sequence();
		value entries=extractKeys(arguments.source)
				.map((String key) {
			value attribute=findAttribute(key, attributes);
			if(exists attribute){
				value toConvert=extractValue(arguments.source, key);
				value part=delegator.convert(toConvert, attribute.type);
				return attribute->part;
			}
			else{
				throw CreationError(kind,Exception("Can't find attribute by name: ``key`` in ``arguments.resultClass`` type"));
			}
		});
		return AttributePartialization(entries);
	}
	
	 
	
	
	
}
