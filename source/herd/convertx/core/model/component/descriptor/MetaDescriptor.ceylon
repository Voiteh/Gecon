import herd.convertx.core.api.component {
	Descriptor,
	DescriptionException,
	Component
}
import herd.convertx.core.api.meta {
	Description
}
import ceylon.language.meta.model {
	Class
}
import ceylon.language.meta {
	type
}
import ceylon.collection {
	ArrayList
}
import herd.convertx.core.api.meta.support {
	MetaPart
}
import herd.convertx.core.util {
	filterObjectAndIdentifiableAttributes
}
import herd.convertx.core.model {
	AttributeDescription
}

service(`interface Component`)
shared class MetaDescriptor() satisfies Descriptor<Object,Object>{
	shared actual Description describe(Object source, Class<Object,Nothing> destinationType) {
		value sourceType=type(source);
		value parts=ArrayList<MetaPart>();
		for(value destAttribute in destinationType.getAttributes<>().filter(filterObjectAndIdentifiableAttributes)){
			value sourceAttribute = sourceType.getAttribute<>(destAttribute.declaration.name);
			try{
				value obtain=sourceAttribute?.bind(source)?.get();
				parts.add(MetaPart(obtain, destAttribute.declaration,destAttribute.type));
			}catch (Exception x){
				throw DescriptionException(source, destinationType,x);
			}
		}
		return AttributeDescription(parts.sequence());
	}
	
	
	matcher => object satisfies MetaDescriptor.Matcher{
		shared actual Boolean match(Object source, Class<Object,Nothing> destinationType) => destinationType.declaration.serializable;
		
		shared actual Integer priority => 0;
		
		
	};
	

	
}

