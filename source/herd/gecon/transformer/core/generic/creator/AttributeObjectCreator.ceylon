import ceylon.language.meta.model {
	Class,
	Attribute
}
import ceylon.language.serialization {
	deserialization
}

import herd.gecon.api.dictionary {
	AttributeDictionary
}
import herd.gecon.api.transformer {
	Creator,
	Delegator
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
	
	shared actual Matcher matcher => Matcher{
		Boolean predicate(AttributeDictionary source, Class<Object,Nothing> resultType) => true;
		Integer priority =0;
	};
	
	
}
