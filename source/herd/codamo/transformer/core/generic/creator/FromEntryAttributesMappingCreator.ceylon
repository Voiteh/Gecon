
import ceylon.language.meta {
	type
}
import ceylon.language.meta.model {
	Type,
	Class,
	Attribute
}

import herd.codamo.api.core.meta {
	AttributesMapping
}
import herd.codamo.api.core.transformer {
	Creator,
	Delegator,
	Matchable
}
import herd.codamo.api.core.util {
	filterObjectAndIdentifiableAttributes
}

"Creator for [[AttributesMapping]], uses [[Entry]] of Source->Type< Result > as arguments "
tagged("Generic")
by("Wojciech Potiopa")
shared class FromEntryAttributesMappingCreator() extends Creator<Object->Type<Object>,AttributesMapping>(){
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
	
	matchable => object satisfies Matchable<Object->Type<Object>,Class<AttributesMapping>>{
		shared actual Boolean predicate(Object->Type<Object> source, Class<AttributesMapping,Nothing> resultType) => true;
		
		shared actual Integer priority = 0;
		
		
	};

}

