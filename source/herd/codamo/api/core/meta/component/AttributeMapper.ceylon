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
	Delegator
}


"Support class for generic convertion application. This API provides ability, for mapping [[Source]] to [[Result]] attributes for data model classes."
by("Wojciech Potiopa")
shared abstract class AttributeMapper<Source,Result>()
		 extends Creator<Relation<Source, Result>,AttributesMapping>()
		given Source satisfies Object
		{
	"Defines relations between [[Source]] and [[Result]] attributes. This is working as whitelist. Any non provided mapping will be ingored."
	shared formal {<Attribute<Source>->Attribute<Result>>*} relations;
	
	"Creates mappings for specific [[relations]]."
	shared actual AttributesMapping create(Delegator delegator, Class<AttributesMapping,Nothing> kind, Relation<Source,Result> arguments) {
		value entries=relations.collect((Attribute<Source,Anything,Nothing> sourceAttribute -> Attribute<Result,Anything,Nothing> destAttribute) {
			value sourcePartValue=sourceAttribute.bind(arguments.source).get();
			value resultPartValue=delegator.convert(sourcePartValue,destAttribute.type);
			return destAttribute->resultPartValue;
		});
		return AttributesMapping(entries);
	}
	
}