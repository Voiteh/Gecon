
import herd.convertx.api.meta {
	Partialization,
	Relation,
	filterObjectAndIdentifiableAttributes
}
import ceylon.language.meta.model {
	Class,
	Attribute
}
import herd.convertx.api {
	Context
}
import ceylon.language.meta {
	type
}
import herd.convertx.api.component {
	Creator
}
shared abstract class ObjectPartializer<ThePartialization,Holder,Result>() satisfies Creator<Relation<Object,Result>,ThePartialization> given ThePartialization satisfies Partialization {
	shared actual ThePartialization create(Context context, Class<ThePartialization,Nothing> kind, Relation<Object,Result> arguments) {
		value sourceType=type(arguments.source);
		value attributes=sourceType.getAttributes<>().filter(filterObjectAndIdentifiableAttributes);
		value holder=mapAttributes(context,arguments.source,attributes);
		return createPartialization(holder);
	}
	shared formal Holder mapAttributes(Context context,Object source,{Attribute<>*} attributes);
	
	shared formal ThePartialization createPartialization(Holder holder);

	
	
}


