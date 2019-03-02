import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.core.transformer {
	Converter,
	Delegator
}

"Converts [[Boolean]] type value into [[Integer]] 
 
 Possible corelations source -> result:
 
 true -> 1
 
 false -> 0"
tagged("Basic")
by("Wojciech Potiopa")
shared class BooleanToIntegerConverter() extends Converter<Boolean,Integer,Type<Integer>>()  {
	"Executes the convertion"
	shared actual Integer convert(Delegator delegator, Boolean source, Type<Integer> resultType){
		switch (source)
		case (true) { return 1; }
		case (false) { return 0; }
	}
	
}