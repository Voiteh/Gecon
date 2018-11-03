import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.component {
	Converter
}
import herd.codamo.api.operation {
	Delegator,
	wired
}

shared wired class BooleanToIntegerConverter() satisfies Converter<Boolean,Integer>  {
	shared actual Integer convert(Delegator delegator, Boolean source, Type<Integer> resultType){
		switch (source)
		case (true) { return 1; }
		case (false) { return 0; }
	}
	
}