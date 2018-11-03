import ceylon.language.meta.model {
	Class,
	Attribute
}


import herd.codamo.api.meta {
	Relation,
	AttributesMapping
}
import herd.codamo.api.component {
	Creator
}
import herd.codamo.api.operation {
	Delegator
}

"Support class for generic convertion application. This API provides ability, for mapping [[Source]] to [[Result]] attributes for data model classes."
shared abstract class AttributeMapper<Source,Result>()
		 satisfies Creator<Relation<Source, Result>,AttributesMapping>
		given Source satisfies Object
		{
	"Defines relations between [[Source]] and [[Result]] attributes. This is working as whitelist. Any non provided mapping will be ingored."
	shared formal {<Attribute<Source>->Attribute<Result>>*} relations;
	
	"Creates mappings for specific [[relations]]."
	shared actual AttributesMapping create(Delegator delegator, Class<AttributesMapping,Nothing> kind, Relation<Source,Result> arguments) {
		value entries=relations.map((Attribute<Source,Anything,Nothing> sourceAttribute -> Attribute<Result,Anything,Nothing> destAttribute) {
			value sourcePartValue=sourceAttribute.bind(arguments.source).get();
			value resultPartValue=delegator.convert(sourcePartValue,destAttribute.type);
			return destAttribute->resultPartValue;
		});
		return AttributesMapping(entries);
	}
	
}