import herd.gecon.api.transformer {
	Mapper,
	Relation
}
import herd.gecon.api.dictionary {
	KeyToValueDictionary
}
import ceylon.language.meta.model {
	Attribute,
	Class
}
import herd.gecon.api.util {
	filterObjectAndIdentifiableAttributes
}
import ceylon.language.meta {
	type
}

shared class SourceKeyValueMapper()
		extends Mapper<Object,{<String->Anything>*},KeyToValueDictionary>() {
	shared actual KeyToValueDictionary map(Relation<Object,{<String->Anything>*}> relation) {
		value sourceType = type(relation.source);
		value mapping = sourceType.getAttributes<>()
			.filter(filterObjectAndIdentifiableAttributes)
			.map((Attribute<Nothing,Anything,Nothing> attr) => attr.declaration.name -> attr.bind(relation.source).get()
		);
		return KeyToValueDictionary(mapping);
	}
	
	shared actual Matcher matcher => Matcher {
		predicate(Relation<Object,{<String->Anything>*}> source, Class<KeyToValueDictionary,Nothing> resultType) => true;
		priority = 0;
	};
}
