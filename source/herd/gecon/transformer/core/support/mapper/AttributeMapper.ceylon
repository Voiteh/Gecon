import ceylon.language.meta.model {
	Attribute
}

import herd.gecon.api.dictionary {
	AttributeDictionary
}
import herd.gecon.api.transformer {
	Mapper,
	Relation
}
import herd.gecon.api.util {
	filterObjectAndIdentifiableAttributes
}
shared abstract class AttributeMapper<Source,Result>() extends Mapper<Source,Result,AttributeDictionary>() given Source satisfies Object {
	
	shared formal Anything extractSourceValue(Attribute<Result> resultAttribute,Source source);
		
	shared actual AttributeDictionary map(Relation<Source,Result> relation) {
			value mapping=relation.resultClass.getAttributes<Result>()
					.filter(filterObjectAndIdentifiableAttributes)
						.tabulate((Attribute<Result,Anything,Nothing> key) => extractSourceValue(key, relation.source));
		return AttributeDictionary(mapping);
	}
	
	
}

