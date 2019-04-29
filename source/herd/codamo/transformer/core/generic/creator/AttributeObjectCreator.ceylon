import ceylon.language.meta.model {
	Class,
	Attribute
}
import ceylon.language.serialization {
	deserialization
}

import herd.codamo.api.core.dictionary {
	AttributeDictionary
}
import herd.codamo.api.core.transformer {
	Creator,
	Delegator,
	Matchable
}
"Creates generic objects from [[AttributeDictionary]], core creator"
tagged("Generic")
by("Wojciech Potiopa")
shared class AttributeObjectCreator() extends Creator<AttributeDictionary,Object>() {
	shared actual Object create(Delegator delegator, AttributeDictionary mapping,Class<Object,Nothing> kind) {
		value instanceId = kind.string;
		value deserializationContext = deserialization<String>();
		try {
			deserializationContext.instance(instanceId, kind);
			mapping.each((Attribute<> resultAttribute-> Anything sourcePartValue) {
				value converted = delegator.convert(sourcePartValue, resultAttribute.type);
				deserializationContext.attribute(instanceId, resultAttribute.declaration, resultAttribute.declaration.name);
				deserializationContext.instanceValue(resultAttribute.declaration.name, converted);
			});
			return deserializationContext.reconstruct<Object>(instanceId);
		} catch (Exception x) {
			throw Error(kind, x);
		}
	}
	matchable => object satisfies Matchable<AttributeDictionary,Class<Object,Nothing>>{
		shared actual Boolean predicate(AttributeDictionary source, Class<Object,Nothing> resultType) => true;
		
		shared actual Integer priority =0;
		
		
	};
	
}
