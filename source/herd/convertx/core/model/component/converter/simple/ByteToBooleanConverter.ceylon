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
shared class ByteToBooleanConverter() satisfies Converter<Byte,Boolean> {
	shared actual Boolean convert(Context context, Byte source, Type<Boolean> resultType) {
		value convert = context.convert(source, `Integer`);
		return context.convert(convert, `Boolean`);
	}
	
}
