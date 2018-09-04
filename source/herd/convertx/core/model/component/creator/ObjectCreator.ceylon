import herd.convertx.core.api.component {
	Creator,
	CreationException,
	Component,
	wired
}
import ceylon.language.meta.model {
	Class,
	Attribute
}
import herd.convertx.core.api.meta.support {
	AttributePartialization
}
import ceylon.language.serialization {
	deserialization
}
import herd.convertx.core.api {
	Context
}

wired
shared class ObjectCreator() satisfies Creator<Object,AttributePartialization> {
	shared actual Object create(Context context,Class<Object,Nothing> kind, AttributePartialization partialization) {
		value instanceId = kind.string;
		value deserializationContext = deserialization<String>();
		deserializationContext.instance(instanceId, kind);
		try {
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
