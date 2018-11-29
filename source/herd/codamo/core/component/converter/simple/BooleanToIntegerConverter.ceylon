import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.component {
	Converter
}
import herd.codamo.api.operation {
	Delegator,
	provided
}
"Converts [[Boolean]] type value into [[Integer]] 
 
 Possible corelations source -> result:
 
 true -> 1
 
 false -> 0"
tagged("Basic")
by("Wojciech Potiopa")
shared provided class BooleanToIntegerConverter() satisfies Converter<Boolean,Integer>  {
	"Executes the convertion"
	shared actual Integer convert(Delegator delegator, Boolean source, Type<Integer> resultType){
		switch (source)
		case (true) { return 1; }
		case (false) { return 0; }
	}
	
}