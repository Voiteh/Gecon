import herd.convertx.core.api.component {
	Creator,
	CreationException,
	AdaptationException,
	Component
}
import ceylon.language.meta.model {
	Class
}
import herd.convertx.core.api.meta.support {
	MetaAccumulator
}
import ceylon.language.serialization {
	DeserializationException,
	deserialization
}
service (`interface Component`)
shared class ObjectCreator() satisfies Creator<Object,MetaAccumulator> {
	shared actual Object create(Class<Object,Nothing> kind, MetaAccumulator arguments) {
		value instanceId = kind.string;
		value context = deserialization<String>();
		context.instance(instanceId, kind);
		
		for (value targetable -> data in arguments.accumulated) {
			if (is AdaptationException error = data) {
				throw CreationException(kind, error);
			}
			context.attribute(instanceId, targetable.declaration, targetable.declaration.string);
			context.instanceValue(targetable.declaration.string, data);
		}
		try {
			return context.reconstruct<Object>(instanceId);
		} catch (DeserializationException x) {
			throw CreationException(kind, x);
		}
	}
	
	matcher => object satisfies ObjectCreator.Matcher {
		shared actual Boolean match(Class<Object,Nothing> kind, MetaAccumulator arguments) => kind.declaration.serializable;
		
		shared actual Integer priority => 0;
	};
}
