import ceylon.language.meta.model {
	Class,
	Attribute
}


import herd.modaco.api.meta {
	Relation,
	AttributePartialization
}
import herd.modaco.api.component {
	Creator
}
import herd.modaco.api.operation {
	Delegator
}


shared abstract class AttributeMapper<Source,Result>()
		 satisfies Creator<Relation<Source, Result>,AttributePartialization>
		given Source satisfies Object
		{
	shared formal {<Attribute<Source>->Attribute<Result>>*} relations;
	shared actual AttributePartialization create(Delegator delegator, Class<AttributePartialization,Nothing> kind, Relation<Source,Result> arguments) {
		value entries=relations.map((Attribute<Source,Anything,Nothing> sourceAttribute -> Attribute<Result,Anything,Nothing> destAttribute) {
			value sourcePartValue=sourceAttribute.bind(arguments.source).get();
			value resultPartValue=delegator.convert(sourcePartValue,destAttribute.type);
			return destAttribute->resultPartValue;
		});
		return AttributePartialization(entries);
	}
	
}