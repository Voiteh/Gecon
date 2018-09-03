import ceylon.language.meta.model {
	Type,
	Class,
	Attribute
}
import herd.convertx.core.api.component {
	Creator,
	wired
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.meta.support {
	EntryPartialization
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
wired
shared class EntryPartializationCreator() satisfies Creator<EntryPartialization,Object->Type<Map<String,Anything>>> {
	shared actual EntryPartialization create(Context context, Class<EntryPartialization,Nothing> kind, Object->Type<Map<String,Anything>> arguments) {
		value sourceType = type(arguments.key);
		value entries = sourceType.getAttributes<>().filter(filterObjectAndIdentifiableAttributes).map((Attribute<Nothing,Anything,Nothing> attr) {
				value sourcePartValue = attr.bind(arguments.key).get();
				return attr.declaration.name->sourcePartValue;
			});
		return EntryPartialization(HashMap<String,Anything> { entries = entries; });
	}
	matcher => object satisfies EntryPartializationCreator.Matcher {
		shared actual Boolean match(Class<EntryPartialization,Nothing> kind, Object->Type<Map<String,Anything>> arguments) => true;
		
		shared actual Integer priority => 1;
	};
}
