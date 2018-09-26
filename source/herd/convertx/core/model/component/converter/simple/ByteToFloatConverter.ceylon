import ceylon.language.meta.model {
	Type
}
import herd.convertx.api {
	Context,
	Converter,
	wired
}

shared wired class ByteToFloatConverter() satisfies Converter<Byte,Float>  {
	shared actual Float convert(Context context, Byte source, Type<Float> resultType){
		value convert = context.convert(source, `Integer`);
		return convert.float;
	}
	
}