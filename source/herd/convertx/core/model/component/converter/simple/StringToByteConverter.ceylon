import herd.convertx.core.api.component {
	Converter,
	wired
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	Type
}
wired
shared class StringToByteConverter() satisfies Converter<String,Byte> {
	shared actual Byte convert(Context context, String source, Type<Byte> resultType){
		value convert=context.convert(source,`Integer`);
		return convert.byte;
	}
	
	
}







