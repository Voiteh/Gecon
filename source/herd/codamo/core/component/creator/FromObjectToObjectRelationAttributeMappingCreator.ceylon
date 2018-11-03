
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


import herd.codamo.api.meta {
	AttributesMapping,
	filterObjectAndIdentifiableAttributes
}
import herd.codamo.api.operation {
	Creation,
	Delegator,
	wired
}
import herd.codamo.api.component {
	Creator
}
wired
shared class FromObjectToObjectRelationAttributeMappingCreator() satisfies Creator<Object->Type<Object>,AttributesMapping>{
	shared actual AttributesMapping create(Delegator delegator, Class<AttributesMapping,Nothing> kind, Object->Type<Object> arguments){
		assert(is Class<Object> clazz=arguments.item);
		value sourceType=type(arguments.key);
		value entries=clazz.getAttributes<>().filter(filterObjectAndIdentifiableAttributes).map((Attribute<Nothing,Anything,Nothing> destAttribute) {
			value sourceAttribute = sourceType.getAttribute<>(destAttribute.declaration.name);
			value sourcePartValue=sourceAttribute?.bind(arguments.key)?.get();
			value destPartValue=delegator.convert(sourcePartValue,destAttribute.type);
			return destAttribute->destPartValue;
		});
		return AttributesMapping(HashMap<Attribute<>,Anything>{entries=entries;});
	}
	
	shared actual Creation<Object->Type<Object>,AttributesMapping,AttributesMapping>.Matcher? matcher => object satisfies Creation<Object->Type<Object>,AttributesMapping,AttributesMapping>.Matcher{
		shared actual Boolean match(Class<AttributesMapping,Nothing> kind, Object->Type<Object> arguments) => true;
		
		shared actual Integer priority => 0;		
	};
}

