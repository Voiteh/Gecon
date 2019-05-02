
import ceylon.language.meta.model {
	Class
}

import herd.gecon.core.api.transformer {
	Delegator,
	Creator}

"Creator for [[Array]], using any iterable as argumets."
tagged("Generic")
by("Wojciech Potiopa")
shared class ArrayCreator() extends Creator<{Anything*},List<>>() {
	shared actual List<> create(Delegator delegator, {Anything*} arguments,Class<List<>,Nothing> kind) {
		return kind.apply(arguments);
	}
	
	
	shared actual Matcher matcher => Matcher{
		Boolean predicate({Anything*} source, Class<List<Anything>,Nothing> resultType) => resultType.declaration==`class Array`;
		Integer priority =1;
	};
	
}

