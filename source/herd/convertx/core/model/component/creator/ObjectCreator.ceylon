import herd.convertx.core.api.component {
	Creator,
	CreationException,
	wired
}
import ceylon.language.meta.model {
	Class,
	Attribute
}

import ceylon.language.serialization {
	deserialization
}
import herd.convertx.core.api {
	Context
}

import herd.convertx.core.api.meta {
	AttributePartialization
}

wired
shared class ObjectCreator() satisfies Creator<AttributePartialization,Object> {
	shared actual Object create(Context context,Class<Object,Nothing> kind, AttributePartialization partialization) {
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
			throw CreationException(kind, x);
		}
	}
	
	matcher => object satisfies ObjectCreator.Matcher {
		shared actual Boolean match(Class<Object,Nothing> kind, AttributePartialization arguments) =>true;
		
		shared actual Integer priority => 0;
	};
}
