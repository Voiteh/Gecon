import herd.convertx.core.api.component {
	Creator
}
import herd.convertx.core.api.meta {
	Partialization
}
import ceylon.language.meta.model {
	Type,
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
shared abstract class ObjectPartializer<ThePartialization,Holder,Result>() satisfies Creator<ThePartialization,Object->Type<Result>> given ThePartialization satisfies Partialization {
	shared actual ThePartialization create(Context context, Class<ThePartialization,Nothing> kind, Object->Type<Result> arguments) {
		value sourceType=type(arguments.key);
		value attributes=sourceType.getAttributes<>().filter(filterObjectAndIdentifiableAttributes);
		value holder=mapAttributes(context,arguments.key,attributes);
		return createPartialization(holder);
	}
	shared formal Holder mapAttributes(Context context,Object source,{Attribute<>*} attributes);
	
	shared formal ThePartialization createPartialization(Holder holder);

	
	
}


