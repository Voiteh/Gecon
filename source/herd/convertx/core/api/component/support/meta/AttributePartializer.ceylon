import herd.convertx.core.api.component {
	Creator,
	CreationException
}
import herd.convertx.core.api.meta.support {
	AttributePartialization
}
import ceylon.language.meta.model {
	ClassOrInterface,
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

shared abstract class AttributePartializer<Source, Result>()
		satisfies Creator<AttributePartialization,Source->ClassOrInterface<Result>>
		given Source satisfies Object {
	
	
	shared formal String[] extractKeys(Source source);
	shared formal Anything extractValue(Source source, String key);
	shared default Attribute<>? findAttribute(String key,Attribute<>[] resultAttributes)
			=>resultAttributes.find((Attribute<> attribute) => attribute.declaration.name==key);
	
	shared actual AttributePartialization create(Context context, Class<AttributePartialization,Nothing> kind, Source->ClassOrInterface<Result> arguments) {
		value attributes=arguments.item.getAttributes<>().filter(filterObjectAndIdentifiableAttributes).sequence();
		value entries=extractKeys(arguments.key)
				.map((String key) {
			value attribute=findAttribute(key, attributes);
			if(exists attribute){
				value toConvert=extractValue(arguments.key, key);
				value part=context.convert(toConvert, attribute.type);
				return attribute->part;
			}
			else{
				throw CreationException(kind,Exception("Can't find attribute by name: ``key`` in ``arguments.item`` type"));
			}
		});
		return AttributePartialization(HashMap<Attribute<>,Anything>{entries=entries;});
	}
	
	 matcher => object satisfies AttributePartializer<Source, Result>.Matcher{
		
		shared actual Integer priority => 1;
		shared actual Boolean match(Class<AttributePartialization,Nothing> kind, Source->ClassOrInterface<Result> arguments) => true;
		
		
		
	};
	
	
	
}
