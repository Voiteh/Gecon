
import ceylon.language.meta {
	type
}
import ceylon.language.meta.model {
	Class,
	Attribute
}

import herd.codamo.api.core.meta {
	Relation,
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

"Creator for [[AttributesMapping]], uses [[Relation]] as arguments."
tagged("Generic")
by("Wojciech Potiopa")
shared class FromRelationAttributesMappingCreator() extends Creator<Relation<Object,Object>,AttributesMapping>(){
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

	matchable => object satisfies Matchable<Relation<Object,Object>,Class<AttributesMapping,Nothing> >{
		shared actual Boolean predicate(Relation<Object,Object> source, Class<AttributesMapping,Nothing> resultType) => true;
		
		shared actual Integer priority =0;
		
		
	};
	
}

