

import ceylon.language.meta.model {
	Type
}
import herd.codamo.api.core.transformer {
	Converter,
	provided
}
import herd.codamo.api.core.operation {
	Delegator
}
provided class AutoProvidedConverter() satisfies Converter<String,Null>{
	shared actual Null convert(Delegator delegator, String source, Type<Null> resultType) => null;
	
	
}