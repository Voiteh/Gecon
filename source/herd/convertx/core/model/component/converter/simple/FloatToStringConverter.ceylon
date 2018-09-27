import ceylon.language.meta.model {
	Type
}
import herd.convertx.api {
	wired
}
import herd.convertx.api.component {
	Converter
}
import herd.convertx.api.operation {
	Delegator
}

wired
shared class FloatToStringConverter() satisfies Converter<Float,String>  {
	shared actual String convert(Delegator delegator, Float source, Type<String> resultType) =>  source.string;
	
}