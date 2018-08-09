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
shared class BooleanToIntegerConverter() satisfies Converter<Boolean,Integer>  {
	shared actual Integer convert(Context context, Boolean source, Type<Integer> resultType){
		switch (source)
		case (true) { return 1; }
		case (false) { return 0; }
	}
	
}