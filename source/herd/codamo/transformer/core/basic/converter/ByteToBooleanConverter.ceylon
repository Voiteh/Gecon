
import ceylon.language.meta.model {
	Type
}
import herd.codamo.api.core.transformer {
	Converter,
	provided,
	Delegator
}
"Converts [[Byte]] type value into [[Boolean]]
 
 Possible corelations source -> result:
 
 0.byte -> false
 
 1.byte -> true

 Given [[Byte]] x, x < 0.byte | x > 1.byte. x -> ConvertionError"
tagged("Basic")
by("Wojciech Potiopa")
shared provided class ByteToBooleanConverter() satisfies Converter<Byte,Boolean> {
	shared actual Boolean convert(Delegator delegator, Byte source, Type<Boolean> resultType) {
		value convert = delegator.convert(source, `Integer`);
		return delegator.convert(convert, `Boolean`);
	}
	
}
