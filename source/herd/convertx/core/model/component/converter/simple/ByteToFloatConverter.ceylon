import ceylon.language.meta.model {
	Type
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.component {
	Converter,
	Component
}
service(`interface Component`)
shared class ByteToFloatConverter() satisfies Converter<Byte,Float>  {
	shared actual Float convert(Context context, Byte source, Type<Float> resultType){
		value convert = context.convert(source, `Integer`);
		return convert.float;
	}
	
}