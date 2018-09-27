
import ceylon.language.meta.model {
	Type,
	Class,
	Attribute
}


import ceylon.language.meta {
	type
}

import ceylon.collection {
	HashMap
}


import herd.convertx.api.meta {
	AttributePartialization,
	filterObjectAndIdentifiableAttributes
}
import herd.convertx.api.operation {
	Creation,
	Delegator,
	wired
}
import herd.convertx.api.component {
	Creator
}
wired
shared class ObjectToObjectPartializationCreator() satisfies Creator<Object->Type<Object>,AttributePartialization>{
	shared actual AttributePartialization create(Delegator delegator, Class<AttributePartialization,Nothing> kind, Object->Type<Object> arguments){
		assert(is Class<Object> clazz=arguments.item);
		value sourceType=type(arguments.key);
		value entries=clazz.getAttributes<>().filter(filterObjectAndIdentifiableAttributes).map((Attribute<Nothing,Anything,Nothing> destAttribute) {
			value sourceAttribute = sourceType.getAttribute<>(destAttribute.declaration.name);
			value sourcePartValue=sourceAttribute?.bind(arguments.key)?.get();
			value destPartValue=delegator.convert(sourcePartValue,destAttribute.type);
			return destAttribute->destPartValue;
		});
		return AttributePartialization(HashMap<Attribute<>,Anything>{entries=entries;});
	}
	
	shared actual Creation<Object->Type<Object>,AttributePartialization,AttributePartialization>.Matcher? matcher => object satisfies Creation<Object->Type<Object>,AttributePartialization,AttributePartialization>.Matcher{
		shared actual Boolean match(Class<AttributePartialization,Nothing> kind, Object->Type<Object> arguments) => true;
		
		shared actual Integer priority => 0;		
	};
}

