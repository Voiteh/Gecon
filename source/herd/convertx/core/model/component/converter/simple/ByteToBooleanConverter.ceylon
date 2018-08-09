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
shared class ByteToBooleanConverter() satisfies Converter<Byte,Boolean> {
	shared actual Boolean convert(Context context, Byte source, Type<Boolean> resultType) {
		value convert = context.convert(source, `Integer`);
		return context.convert(convert, `Boolean`);
	}
	
}
