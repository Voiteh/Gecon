
import herd.codamo.api.core.meta {
	Mapping,
	Relation,
	filterObjectAndIdentifiableAttributes
}
import ceylon.language.meta.model {
	Class,
	Attribute
}

import ceylon.language.meta {
	type
}
import herd.codamo.api.core.transformer {
	Creator,
	Delegator
}

"Mapper providing API for generic Object type mapping. Usable only for generic applications"
by("Wojciech Potiopa")
shared abstract class ObjectToObjectMapper<SourceToResultMapping,Holder,Result>() satisfies Creator<Relation<Object,Result>,SourceToResultMapping> given SourceToResultMapping satisfies Mapping {
	shared actual SourceToResultMapping create(Delegator delegator, Class<SourceToResultMapping,Nothing> kind, Relation<Object,Result> arguments) {
		value sourceType=type(arguments.source);
		value attributes=sourceType.getAttributes<>().filter(filterObjectAndIdentifiableAttributes);
		value holder=mapAttributes(delegator,arguments.source,attributes);
		return createMapping(holder);
	}
	shared formal Holder mapAttributes(Delegator delegator,Object source,{Attribute<>*} attributes);
	
	shared formal SourceToResultMapping createMapping(Holder holder);

	
	
}


