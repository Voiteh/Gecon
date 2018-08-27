import herd.convertx.core.api.meta.support {
	AttributePartialization
}
import ceylon.language.meta.model {
	Type,
	Class,
	ClassOrInterface,
	Attribute
}
import herd.convertx.core.api.component {
	Creator,
	CreationException,
	Component
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
service(`interface Component`)
shared class AttributePartializationMapCreator() satisfies Creator<AttributePartialization,Map<String,Anything>->ClassOrInterface<Object>>{
	shared actual AttributePartialization create(Context context, Class<AttributePartialization,Nothing> kind, Map<String,Anything>->ClassOrInterface<Object> arguments) {
		value attributes=arguments.item.getAttributes<>().filter(filterObjectAndIdentifiableAttributes).sequence();
		value entries=arguments.key.map((String key -> Anything item) {
			value attribute = attributes.find((Attribute<Nothing,Anything,Nothing> element) => element.declaration.name==key);
			if(exists attribute){
				value convertedValue=context.convert(item, attribute.type);
				return attribute->convertedValue;
			}
			else{
				throw CreationException(kind,Exception("Can't find attribute by name: ``key`` in ``arguments.item`` type"));
			}
		});
		return AttributePartialization(HashMap<Attribute<>,Anything>{entries=entries;});
	}
	
	matcher => object satisfies AttributePartializationMapCreator.Matcher{
		shared actual Boolean match(Class<AttributePartialization,Nothing> kind, Map<String,Anything>->ClassOrInterface<Object> arguments) => true;
		
		shared actual Integer priority => 1;
		
		
	};
}