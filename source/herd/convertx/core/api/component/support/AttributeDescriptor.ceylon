
import ceylon.language.meta.model {
	Attribute,
	Class
}

import herd.convertx.core.api.meta {
	Description
}
import ceylon.collection {
	ArrayList
}
import herd.convertx.core.api.component {
	Descriptor,
	DescriptionException
}
import herd.convertx.core.api.meta.support {
	MetaPart,
	AttributeDescription
}
import herd.convertx.core.util {
	filterObjectAndIdentifiableAttributes
}

shared class AttributeDescriptor<Source,Destination>({<Attribute<Source>-> Attribute<Destination>>*} attributes) satisfies Descriptor<Source, Destination>{
	shared actual Description describe(Source source, Class<Destination,Nothing> destinationType){
		value parts=ArrayList<MetaPart>();
		for(value destinationAttribute in destinationType.getAttributes<>().filter(filterObjectAndIdentifiableAttributes)){
			value sourceAttribute = attributes.find((Attribute<Source,Anything,Nothing> elementKey -> Attribute<Destination,Anything,Nothing> elementItem) => destinationAttribute==elementItem)?.key;
			try{
				value obtain=sourceAttribute?.bind(source)?.get();
				parts.add(MetaPart(obtain, destinationAttribute.declaration,destinationAttribute.type));
			}catch (Exception x){
				throw DescriptionException(source, destinationType,x);
			}
		}
		return AttributeDescription(parts.sequence());
	}
	
	
	
}