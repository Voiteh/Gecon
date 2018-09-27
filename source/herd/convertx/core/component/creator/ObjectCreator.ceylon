import ceylon.language.meta.model {
	Class,
	Attribute
}

import ceylon.language.serialization {
	deserialization
}



import herd.convertx.api.meta {
	AttributePartialization
}
import herd.convertx.api.operation {
	Creation,
	CreationError,
	Delegator,
	wired
}
import herd.convertx.api.component {
	Creator
}


shared wired class ObjectCreator() satisfies Creator<AttributePartialization,Object> {
	shared actual Object create(Delegator delegator,Class<Object,Nothing> kind, AttributePartialization partialization) {
		value instanceId = kind.string;
		value deserializationContext = deserialization<String>();
		try {
			deserializationContext.instance(instanceId, kind);
			partialization.parts.each((Attribute<> resultAttribute-> Anything resultPartValue) {
				deserializationContext.attribute(instanceId, resultAttribute.declaration, resultAttribute.declaration.name);
				deserializationContext.instanceValue(resultAttribute.declaration.name, resultPartValue);
			});
			return deserializationContext.reconstruct<Object>(instanceId);
		} catch (Exception x) {
			throw CreationError(kind, x);
		}
	}
	
	shared actual Creation<AttributePartialization,Object,Object>.Matcher? matcher => object satisfies Creation<AttributePartialization,Object,Object>.Matcher{
		shared actual Boolean match(Class<Object,Nothing> kind, AttributePartialization arguments) =>true;
		
		shared actual Integer priority => 0;
	};
}
