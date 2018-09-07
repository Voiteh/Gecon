import herd.convertx.core.api.component {
	Creator
}
import herd.convertx.core.api.meta {
	Partialization,
	Relation
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
shared abstract class ObjectPartializer<ThePartialization,Holder,Result>() satisfies Creator<ThePartialization,Relation<Object,Result>> given ThePartialization satisfies Partialization {
	shared actual ThePartialization create(Context context, Class<ThePartialization,Nothing> kind, Relation<Object,Result> arguments) {
		value sourceType=type(arguments.source);
		value attributes=sourceType.getAttributes<>().filter(filterObjectAndIdentifiableAttributes);
		value holder=mapAttributes(context,arguments.source,attributes);
		return createPartialization(holder);
	}
	shared formal Holder mapAttributes(Context context,Object source,{Attribute<>*} attributes);
	
	shared formal ThePartialization createPartialization(Holder holder);

	
	
}


