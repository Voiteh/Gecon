import herd.convertx.core.api.component {
	Converter,
	Component
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	Type
}
service(`interface Component`)
shared class StringToByteConverter() satisfies Converter<String,Byte> {
	shared actual Byte convert(Context context, String source, Type<Byte> resultType){
		value convert=context.convert(source,`Integer`);
		return convert.byte;
	}
	
	
}







