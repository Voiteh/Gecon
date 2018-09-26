import ceylon.language.meta.model {
	Type
}
import herd.convertx.api {
	Context
}
import herd.convertx.api.component {
	Converter,
	wired
}
wired
shared class BooleanToFloatConverter() satisfies Converter<Boolean,Float>  {
	shared actual Float convert(Context context, Boolean source, Type<Float> resultType) {
		switch(source)
		case (true) { return 1.0;}
		case (false) {return 0.0; }
	}
	
	
}