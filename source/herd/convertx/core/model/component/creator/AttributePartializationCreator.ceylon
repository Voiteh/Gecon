import herd.convertx.core.api.component {
	Creator,
	wired
}
import ceylon.language.meta.model {
	Class,
	Attribute
}
import herd.convertx.core.api {
	Context
}

import ceylon.language.meta {
	type
}
import herd.convertx.core.util {
	filterObjectAndIdentifiableAttributes
}

import ceylon.collection {
	HashMap
}
import herd.convertx.core.api.meta {
	Relation,
	AttributePartialization
}

wired
shared class AttributePartializationCreator() satisfies Creator<Relation<Object,Object>,AttributePartialization>{
	shared actual AttributePartialization create(Context context, Class<AttributePartialization,Nothing> kind, Relation<Object,Object> arguments){
		value sourceType=type(arguments.source);
		value entries=arguments.resultClass.getAttributes<>().filter(filterObjectAndIdentifiableAttributes).map((Attribute<Nothing,Anything,Nothing> destAttribute) {
			value sourceAttribute = sourceType.getAttribute<>(destAttribute.declaration.name);
			value sourcePartValue=sourceAttribute?.bind(arguments.source)?.get();
			value destPartValue=context.convert(sourcePartValue,destAttribute.type);
			return destAttribute->destPartValue;
		});
		return AttributePartialization(HashMap<Attribute<>,Anything>{entries=entries;});
	}
	
	matcher => object satisfies AttributePartializationCreator.Matcher{
		shared actual Boolean match(Class<AttributePartialization,Nothing> kind, Relation<Object,Object> arguments) => true;
		
		shared actual Integer priority => 0;
		
		
	};
}