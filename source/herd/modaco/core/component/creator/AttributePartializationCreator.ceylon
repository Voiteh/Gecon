
import ceylon.language.meta.model {
	Class,
	Attribute
}


import ceylon.language.meta {
	type
}

import herd.modaco.api.meta {
	Relation,
	AttributePartialization,
	filterObjectAndIdentifiableAttributes
}
import herd.modaco.api.operation {
	Creation,
	Delegator,
	wired
}
import herd.modaco.api.component {
	Creator
}



shared wired class AttributePartializationCreator() satisfies Creator<Relation<Object,Object>,AttributePartialization>{
	shared actual AttributePartialization create(Delegator delegator, Class<AttributePartialization,Nothing> kind, Relation<Object,Object> arguments){
		value sourceType=type(arguments.source);
		value entries=arguments.resultClass.getAttributes<>().filter(filterObjectAndIdentifiableAttributes).map((Attribute<Nothing,Anything,Nothing> destAttribute) {
			value sourceAttribute = sourceType.getAttribute<>(destAttribute.declaration.name);
			value sourcePartValue=sourceAttribute?.bind(arguments.source)?.get();
			value destPartValue=delegator.convert(sourcePartValue,destAttribute.type);
			return destAttribute->destPartValue;
		});
		return AttributePartialization(entries);
	}

	shared actual Creation<Relation<Object,Object>,AttributePartialization,AttributePartialization>.Matcher? matcher => object satisfies Creation<Relation<Object,Object>,AttributePartialization,AttributePartialization>.Matcher{
		shared actual Boolean match(Class<AttributePartialization,Nothing> kind, Relation<Object,Object> arguments) => true;
		
		shared actual Integer priority => 0;		
	};
	
}

