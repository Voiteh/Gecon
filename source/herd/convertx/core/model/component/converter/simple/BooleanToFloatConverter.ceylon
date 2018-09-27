import ceylon.language.meta.model {
	Type
}
import herd.convertx.api {
	wired
}
import herd.convertx.api.component {
	Converter
}
import herd.convertx.api.operation {
	Delegator
}


shared wired class BooleanToFloatConverter() satisfies Converter<Boolean,Float>  {
	shared actual Float convert(Delegator delegator, Boolean source, Type<Float> resultType) {
		switch(source)
		case (true) { return 1.0;}
		case (false) {return 0.0; }
	}
	
	
}