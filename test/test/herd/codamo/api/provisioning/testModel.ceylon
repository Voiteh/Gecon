

import ceylon.language.meta.model {
	Type
}
import herd.codamo.api.component {
	Converter
}
import herd.codamo.api.operation {
	Delegator,
	provided
}
provided class AutoProvidedConverter() satisfies Converter<String,Null>{
	shared actual Null convert(Delegator delegator, String source, Type<Null> resultType) => null;
	
	
}