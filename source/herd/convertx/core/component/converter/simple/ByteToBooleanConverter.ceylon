
import ceylon.language.meta.model {
	Type
}
import herd.convertx.api.component {
	Converter
}
import herd.convertx.api.operation {
	Delegator,
	wired
}


shared wired class ByteToBooleanConverter() satisfies Converter<Byte,Boolean> {
	shared actual Boolean convert(Delegator delegator, Byte source, Type<Boolean> resultType) {
		value convert = delegator.convert(source, `Integer`);
		return delegator.convert(convert, `Boolean`);
	}
	
}
