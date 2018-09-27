
import herd.convertx.api {
	wired
}
import ceylon.language.meta.model {
	Type
}
import herd.convertx.api.component {
	Converter
}
import herd.convertx.api.operation {
	Delegator
}
shared wired class WiredConverter() satisfies Converter<String,Null>{
	shared actual Null convert(Delegator delegator, String source, Type<Null> resultType) => null;
	
	
}