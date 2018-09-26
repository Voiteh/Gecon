import herd.convertx.api {
	Context,
	Converter,
	wired
}
import ceylon.language.meta.model {
	Type
}


shared wired class ByteToBooleanConverter() satisfies Converter<Byte,Boolean> {
	shared actual Boolean convert(Context context, Byte source, Type<Boolean> resultType) {
		value convert = context.convert(source, `Integer`);
		return context.convert(convert, `Boolean`);
	}
	
}
