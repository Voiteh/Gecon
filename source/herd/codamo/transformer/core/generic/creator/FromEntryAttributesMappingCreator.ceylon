
import ceylon.language.meta.model {
	Type,
	Class,
	Attribute
}


import ceylon.language.meta {
	type
}


import herd.codamo.api.core.meta {
	AttributesMapping,
	filterObjectAndIdentifiableAttributes
}

import herd.codamo.api.core.transformer {
	Creator,
	provided,
	Creation,
	Delegator
}

"Creator for [[AttributesMapping]], uses [[Entry]] of Source->Type< Result > as arguments "
tagged("Generic")
by("Wojciech Potiopa")
shared provided class FromEntryAttributesMappingCreator() satisfies Creator<Object->Type<Object>,AttributesMapping>{
	shared actual AttributesMapping create(Delegator delegator, Class<AttributesMapping,Nothing> kind, Object->Type<Object> arguments){
		assert(is Class<Object> clazz=arguments.item);
		value sourceType=type(arguments.key);
		value entries=clazz.getAttributes<>().filter(filterObjectAndIdentifiableAttributes).collect((Attribute<Nothing,Anything,Nothing> destAttribute) {
			value sourceAttribute = sourceType.getAttribute<>(destAttribute.declaration.name);
			value sourcePartValue=sourceAttribute?.bind(arguments.key)?.get();
			value destPartValue=delegator.convert(sourcePartValue,destAttribute.type);
			return destAttribute->destPartValue;
		});
		return AttributesMapping(entries);
	}
	
	shared actual Creation<Object->Type<Object>,AttributesMapping,AttributesMapping>.Matcher? matcher => object satisfies Creation<Object->Type<Object>,AttributesMapping,AttributesMapping>.Matcher{
		shared actual Boolean match(Class<AttributesMapping,Nothing> kind, Object->Type<Object> arguments) => true;
		
		shared actual Integer priority => 0;		
	};
}

