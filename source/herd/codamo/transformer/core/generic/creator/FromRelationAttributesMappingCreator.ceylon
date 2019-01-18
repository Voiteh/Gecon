
import ceylon.language.meta.model {
	Class,
	Attribute
}


import ceylon.language.meta {
	type
}

import herd.codamo.api.core.meta {
	Relation,
	AttributesMapping,
	filterObjectAndIdentifiableAttributes
}

import herd.codamo.api.core.transformer {
	Creator,
	provided,
	Creation,
	Delegator
}

"Creator for [[AttributesMapping]], uses [[Relation]] as arguments."
tagged("Generic")
by("Wojciech Potiopa")
shared provided class FromRelationAttributesMappingCreator() satisfies Creator<Relation<Object,Object>,AttributesMapping>{
	shared actual AttributesMapping create(Delegator delegator, Class<AttributesMapping,Nothing> kind, Relation<Object,Object> arguments){
		value sourceType=type(arguments.source);
		value entries=arguments.resultClass.getAttributes<>().filter(filterObjectAndIdentifiableAttributes).collect((Attribute<Nothing,Anything,Nothing> destAttribute) {
			value sourceAttribute = sourceType.getAttribute<>(destAttribute.declaration.name);
			value sourcePartValue=sourceAttribute?.bind(arguments.source)?.get();
			value destPartValue=delegator.convert(sourcePartValue,destAttribute.type);
			return destAttribute->destPartValue;
		});
		return AttributesMapping(entries);
	}

	shared actual Creation<Relation<Object,Object>,AttributesMapping,AttributesMapping>.Matcher? matcher => object satisfies Creation<Relation<Object,Object>,AttributesMapping,AttributesMapping>.Matcher{
		shared actual Boolean match(Class<AttributesMapping,Nothing> kind, Relation<Object,Object> arguments) => true;
		
		shared actual Integer priority => 0;		
	};
	
}

