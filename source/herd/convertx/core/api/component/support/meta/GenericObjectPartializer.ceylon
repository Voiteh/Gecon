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
shared abstract class GenericObjectPartializer<ThePartialization,Holder,Result>() satisfies Creator<ThePartialization,Object->Type<Result>> given ThePartialization satisfies Partialization {
	shared actual ThePartialization create(Context context, Class<ThePartialization,Nothing> kind, Object->Type<Result> arguments) {
		value sourceType=type(arguments.key);
		value attributes=sourceType.getAttributes<>().filter(filterObjectAndIdentifiableAttributes);
		value holder=mapAttributes(arguments.key,attributes);
		return createPartialization(holder);
	}
	shared formal Holder mapAttributes(Object source,{Attribute<>*} attributes);
	
	shared formal ThePartialization createPartialization(Holder holder);

	matcher => object satisfies GenericObjectPartializer<ThePartialization,Holder,Result>.Matcher{
		shared actual Boolean match(Class<ThePartialization,Nothing> kind, Object->Type<Result> arguments) => true;
		
		shared actual Integer priority => 1;
		
		
	};
	
}


