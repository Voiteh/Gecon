import herd.convertx.api.component {
	Converter,
	wired
}
import herd.convertx.api {
	Context
}
import ceylon.language.meta.model {
	Type
}
wired
shared class BooleanToStringConverter() satisfies Converter<Boolean,String>  {
	shared actual String convert(Context context, Boolean source, Type<String> resultType) =>  source.string;
	
}
