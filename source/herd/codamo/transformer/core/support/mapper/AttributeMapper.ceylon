import ceylon.language.meta.model {
	Attribute,
	ClassOrInterface
}

import herd.codamo.api.core.transformer {
	Mapper
}
import herd.codamo.api.core.util {
	filterObjectAndIdentifiableAttributes
}
shared abstract class AttributeMapper<Source,Result>() extends Mapper<Source,ClassOrInterface<Result>>() {
	
	shared formal Anything extractSourceValue(Attribute<Result> resultAttribute,Source source);
		
	shared actual Map<Attribute<>,Anything> map(Source source,ClassOrInterface<Result> resultType) {
		value mapping=resultType.getAttributes<Result>().filter(filterObjectAndIdentifiableAttributes)
				.tabulate((Attribute<Result,Anything,Nothing> key) => extractSourceValue(key, source));
		return mapping;
	}
	
	
}

