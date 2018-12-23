import ceylon.language.meta.model {
	Class,
	Attribute
}

import ceylon.language.serialization {
	deserialization
}



import herd.codamo.api.core.meta {
	AttributesMapping
}

import herd.codamo.api.core.transformer {
	Creator,
	provided,
	Creation,
	CreationError,
	Delegator
}
"Creates generc objects from [[AttributesMapping]], core creator"
tagged("Generic")
by("Wojciech Potiopa")
shared provided class ObjectCreator() satisfies Creator<AttributesMapping,Object> {
	shared actual Object create(Delegator delegator,Class<Object,Nothing> kind, AttributesMapping mapping) {
		value instanceId = kind.string;
		value deserializationContext = deserialization<String>();
		try {
			deserializationContext.instance(instanceId, kind);
			mapping.mappings.each((Attribute<> resultAttribute-> Anything resultPartValue) {
				deserializationContext.attribute(instanceId, resultAttribute.declaration, resultAttribute.declaration.name);
				deserializationContext.instanceValue(resultAttribute.declaration.name, resultPartValue);
			});
			return deserializationContext.reconstruct<Object>(instanceId);
		} catch (Exception x) {
			throw CreationError(kind, x);
		}
	}
	
	shared actual Creation<AttributesMapping,Object,Object>.Matcher? matcher => object satisfies Creation<AttributesMapping,Object,Object>.Matcher{
		shared actual Boolean match(Class<Object,Nothing> kind, AttributesMapping arguments) =>true;
		
		shared actual Integer priority => 0;
	};
}
